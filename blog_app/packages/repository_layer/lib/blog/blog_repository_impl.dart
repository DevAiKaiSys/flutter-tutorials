import 'dart:io';

import 'package:data_layer/blog/blog_api.dart';
import 'package:data_layer/blog/models/blog_model.dart';
import 'package:data_layer/core/error/exceptions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:repository_layer/blog/blog_repository.dart';
import 'package:repository_layer/core/error/failures.dart';
import 'package:uuid/uuid.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogApi blogApi;
  BlogRepositoryImpl(
    this.blogApi,
  );

  @override
  Future<Either<Failure, BlogModel>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  }) async {
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
}
