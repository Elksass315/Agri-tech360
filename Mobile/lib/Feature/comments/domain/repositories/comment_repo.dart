import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class CommentRepo {
  Future<Either<Failure, void>> addComment({
    required String comment,
    required int productId,
  });
  Future<Either<Failure, List<CommentModel>>> getCommernts(
      {required int productId});
}
