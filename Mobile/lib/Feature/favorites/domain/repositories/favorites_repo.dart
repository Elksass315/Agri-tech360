import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, List<FavoriteData>>> getFavorites();

   Future<Either<Failure, void>> addFavorite({
    required int productId,
  });

   Future<Either<Failure, void>> removeFavorite({
    required int productId,
  });
}
