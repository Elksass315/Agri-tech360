import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/comments/data/repositories/comment_repo.dart';
import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';

import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';
import 'package:smartsoil/core/helper/local_services.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';

class CommentRepoImpl extends CommentRepo {

  CommentRepoImpl();

  @override
  Future<Either<Failure, void>> addComment(
      {required String comment, required int productId}) async {
    try {
    String token = await LocalServices.getData(key: 'token');
    FormData formData = FormData.fromMap({
      'comment': comment,
      'product': productId,
    });

    await ApiServices.postFormData(
      formData: formData,
      endpoint: '$baseUrl$addcommentendpoint',
      token: token,
    );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CommentModel>>> getCommernts(
      {required int productId}) async {
    try {
      String token = await LocalServices.getData(key: 'token');

    var response = await ApiServices.getData(
      endpoint: '$baseUrl$getcommentendpoint/$productId',
      token: token,
    );

    List<CommentModel> comments = [];

    if (response.containsKey('data')) {
      for (var product in response['data']) {
        comments.add(CommentModel.fromJson(product));
      }
    }

      return right(comments);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
