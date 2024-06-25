import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/Feature/favorites/data/repositories/favorites_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';
import 'package:smartsoil/core/helper/local_services.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';

class FavoritesRepoImpl extends FavoritesRepo {

  FavoritesRepoImpl();

  @override
  Future<Either<Failure, List<FavoriteData>>> getFavorites() async {
    try {
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

     return Right(favoriteResult);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addFavorite(
      {required int productId}) async {
    try {
     
    FormData formData = FormData.fromMap({
      'product': productId,
    });

    String token = await LocalServices.getData(key: 'token');
    await ApiServices.postFormData(
      endpoint: '$baseUrl$addFavoriteendpoint',
      token: token,
      formData: formData,
    );
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

    @override
  Future<Either<Failure, void>> removeFavorite(
      {required int productId}) async {
    try {
     
    FormData formData = FormData.fromMap({
      'product': productId,
    });

    String token = await LocalServices.getData(key: 'token');
    await ApiServices.deletFormData(
        endpoint: '$baseUrl$removeFavoriteendpoint',
        token: token,
        formData: formData);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
