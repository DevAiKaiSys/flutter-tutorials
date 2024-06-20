import 'dart:io';

import 'package:data_layer/blog/models/blog_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:repository_layer/core/error/failures.dart';

abstract interface class BlogRepository {
  Future<Either<Failure, BlogModel>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  });
}
