import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:repository_layer/blog/entities/blog_entity.dart';
import 'package:repository_layer/blog/usecases/upload_blog.dart';
import 'package:repository_layer/blog/usecases/get_all_blogs.dart';
import 'package:repository_layer/core/usecase/usecase.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;

  BlogBloc({
    required UploadBlog uploadBlog,
    required GetAllBlogs getAllBlogs,
  })  : _uploadBlog = uploadBlog,
        _getAllBlogs = getAllBlogs,
        super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUpload>(_onBlogUpload);
    on<BlogFetchAllBlogs>(_onFetchAllBlogs);
  }

  Future<FutureOr<void>> _onBlogUpload(
      BlogUpload event, Emitter<BlogState> emit) async {
    final res = await _uploadBlog(
      UploadBlogParams(
        posterId: event.posterId,
        title: event.title,
        content: event.content,
        image: event.image,
        topics: event.topics,
      ),
    );

    res.fold(
      (failure) => emit(BlogFailure(failure.message)),
      (blog) => emit(BlogUploadSuccess()),
    );
  }

  Future<FutureOr<void>> _onFetchAllBlogs(
      BlogFetchAllBlogs event, Emitter<BlogState> emit) async {
    final res = await _getAllBlogs(NoParams());

    res.fold(
      (failure) => emit(BlogFailure(failure.message)),
      (blog) => emit(BlogsDisplaySuccess(blog)),
    );
  }
}
