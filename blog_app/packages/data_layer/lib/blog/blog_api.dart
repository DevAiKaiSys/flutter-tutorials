import 'dart:io';

import 'package:data_layer/blog/models/blog_model.dart';

abstract interface class BlogApi {
  Future<BlogModel> uploadBlog(BlogModel blog);
  Future<String> uploadBlogImage({
    required File image,
    required BlogModel blog,
  });
  Future<List<BlogModel>> getAllBlogs();
}
