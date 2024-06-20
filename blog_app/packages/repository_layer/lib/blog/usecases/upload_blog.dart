import 'dart:io';
import 'package:data_layer/blog/models/blog_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:repository_layer/blog/blog_repository.dart';
import 'package:repository_layer/core/error/failures.dart';
import 'package:repository_layer/core/usecase/usecase.dart';

class UploadBlog implements UseCase<BlogModel, UploadBlogParams> {
  final BlogRepository blogRepository;
  UploadBlog(this.blogRepository);

  @override
  Future<Either<Failure, BlogModel>> call(UploadBlogParams params) async {
    return await blogRepository.uploadBlog(
      image: params.image,
      title: params.title,
      content: params.content,
      posterId: params.posterId,
      topics: params.topics,
    );
  }
}

class UploadBlogParams {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  UploadBlogParams({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
