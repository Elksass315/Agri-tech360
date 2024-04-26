import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';

abstract class CommentDataSources {
  Future<void> addComment({
    required String comment,
    required int productId,
  }); // need to add time of the comment  ;

  Future<List<CommentModel>> getComments({
    required int productId,
  });
}
