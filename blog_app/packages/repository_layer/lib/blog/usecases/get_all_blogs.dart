import 'package:fpdart/fpdart.dart';
import 'package:repository_layer/blog/blog_repository.dart';
import 'package:repository_layer/blog/entities/blog_entity.dart';
import 'package:repository_layer/core/error/failures.dart';
import 'package:repository_layer/core/usecase/usecase.dart';

class GetAllBlogs implements UseCase<List<BlogEntity>, NoParams> {
  final BlogRepository blogRepository;
  GetAllBlogs(this.blogRepository);

  @override
  Future<Either<Failure, List<BlogEntity>>> call(NoParams params) async {
    return await blogRepository.getAllBlogs();
  }
}
