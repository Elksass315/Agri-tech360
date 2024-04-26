import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';

abstract class FavoriteDataSource {
  Future<List<FavoriteData>> getFavorites();
  Future<void> addFavorite({required int productId});

  Future<void> removeFavorite({required int productId});
}
