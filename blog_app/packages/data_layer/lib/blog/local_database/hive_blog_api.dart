import 'dart:io';

import 'package:data_layer/blog/blog_api.dart';
import 'package:data_layer/blog/models/blog_model.dart';
import 'package:hive/hive.dart';

class HiveBlogApi implements BlogApi {
  final Box box;
  HiveBlogApi(this.box);

  @override
  Future<List<BlogModel>> getAllBlogs() async {
    await Future.delayed(Duration(milliseconds: 1));

    List<BlogModel> blogs = [];
    box.read(() {
      for (int i = 0; i < box.length; i++) {
        blogs.add(BlogModel.fromJson(box.get(i.toString())));
      }
    });

    return blogs;
  }

  @override
  void uploadLocalBlogs({required List<BlogModel> blogs}) {
    box.clear();

    box.write(() {
      for (int i = 0; i < blogs.length; i++) {
        box.put(i.toString(), blogs[i].toJson());
      }
    });
  }

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) {
    // TODO: implement uploadBlog
    throw UnimplementedError();
  }

  @override
  Future<String> uploadBlogImage(
      {required File image, required BlogModel blog}) {
    // TODO: implement uploadBlogImage
    throw UnimplementedError();
  }
}
