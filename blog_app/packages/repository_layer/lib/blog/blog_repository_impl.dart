import 'dart:io';

import 'package:data_layer/blog/blog_api.dart';
import 'package:data_layer/blog/local_database/hive_blog_api.dart';
import 'package:data_layer/blog/models/blog_model.dart';
import 'package:data_layer/core/error/exceptions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:repository_layer/blog/blog_repository.dart';
import 'package:repository_layer/blog/entities/blog_entity.dart';
import 'package:repository_layer/core/constants/constants.dart';
import 'package:repository_layer/core/error/failures.dart';
import 'package:repository_layer/core/network/connection_checker.dart';
import 'package:uuid/uuid.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogApi blogApi;
  final HiveBlogApi hiveBlogApi;
  final ConnectionChecker connectionChecker;
  BlogRepositoryImpl(
    this.blogApi,
    this.hiveBlogApi,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, BlogModel>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  }) async {
    if (!await (connectionChecker.isConnected)) {
      return left(Failure(Constants.noConnectionErrorMessage));
    }
    try {
      BlogModel blogModel = BlogModel(
        id: const Uuid().v1(),
        posterId: posterId,
        title: title,
        content: content,
        imageUrl: '',
        topics: topics,
        updatedAt: DateTime.now(),
      );

      final imageUrl = await blogApi.uploadBlogImage(
        image: image,
        blog: blogModel,
      );

      blogModel = blogModel.copyWith(
        imageUrl: imageUrl,
      );

      final uploadedBlog = await blogApi.uploadBlog(blogModel);
      return right(uploadedBlog);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<BlogEntity>>> getAllBlogs() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        final blogs = await hiveBlogApi.getAllBlogs();
        return right(blogs.map((model) => convertToBlogEntity(model)).toList());
      }
      final blogs = await blogApi.getAllBlogs();
      hiveBlogApi.uploadLocalBlogs(blogs: blogs);
      return right(blogs.map((model) => convertToBlogEntity(model)).toList());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  BlogEntity convertToBlogEntity(BlogModel model) {
    return BlogEntity(
      id: model.id,
      posterId: model.posterId,
      title: model.title,
      content: model.content,
      imageUrl: model.imageUrl,
      topics: model.topics,
      updatedAt: model.updatedAt,
      posterName: model.posterName,
    );
  }
}
