import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/favorites/data/datasources/favorite_data_soureces.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class FavoritesDataSoureceImpl extends FavoriteDataSource {
  @override
  Future<List<FavoriteData>> getFavorites() async {
    String token = await LocalServices.getData(key: 'token');

    var response = await ApiServices.getData(
      endpoint: '$baseUrl$favoritesendpoint',
      token: token,
    );

    List<FavoriteData> favoriteResult = [];

    if (response.containsKey('data')) {
      if (response['data'] is List) {
        favoriteResult = List<FavoriteData>.from(
          response['data'].map(
            (item) => FavoriteData.fromJson(
              item['product'],
            ),
          ),
        );
      } else {
        favoriteResult.add(
          FavoriteData.fromJson(
            response['data']['product'],
          ),
        );
      }
    }

    return favoriteResult;
  }

  @override
  Future<void> addFavorite({required int productId}) async {
    FormData formData = FormData.fromMap({
      'product': productId,
    });

    String token = await LocalServices.getData(key: 'token');
    await ApiServices.postFormData(
      endpoint: '$baseUrl$addFavoriteendpoint',
      token: token,
      formData: formData,
    );
  }

  @override
  Future<void> removeFavorite({required int productId}) async {
    FormData formData = FormData.fromMap({
      'product': productId,
    });

    String token = await LocalServices.getData(key: 'token');
    await ApiServices.deletFormData(
        endpoint: '$baseUrl$removeFavoriteendpoint',
        token: token,
        formData: formData);
  }
}
