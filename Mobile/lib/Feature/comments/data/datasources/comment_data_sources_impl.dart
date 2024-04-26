import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/comments/data/datasources/comment_data_sources.dart';
import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class CommentDataSourcesImpl extends CommentDataSources {
  @override
  Future<void> addComment({
    required String comment,
    required int productId,
  }) async {
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
  }

  @override
  Future<List<CommentModel>> getComments({required int productId}) async {
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

    return comments;
  }
}
