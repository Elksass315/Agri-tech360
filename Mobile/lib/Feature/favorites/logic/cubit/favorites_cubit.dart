import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/Feature/favorites/domain/repositories/favorites_repo.dart';
import 'package:equatable/equatable.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({required this.favoritesRepo}) : super(FavoritesInitial());

  final FavoritesRepo favoritesRepo;
  List<FavoriteData> favoritesResult = [];
  Set<int> favoritId = {};

  void getFavorites() async {
    emit(const GetFavoritesLoadingState());

    final favoriteEither = await favoritesRepo.getFavorites();

    favoriteEither.fold(
      (failure) {
        emit(GetFavoritesErrorState(error: failure.errMessage.toString()));
      },
      (favorites) {
        favoritesResult = favorites;
        favoritId.clear();
        for (var element in favorites) {
          favoritId.add(element.id);
        }
        emit(GetFavoritesSuccessState(favorites: favorites));
      },
    );
  }

  void addFavorites({required int productId}) {
    emit(AddToFavLoadingState());
    favoritesRepo.addFavorite(productId: productId).then((value) {
      value.fold((failure) {
        emit(AddToFavErrorState(
          error: failure.errMessage.toString(),
        ));
      }, (response) async {
        favoritId.add(productId);
        getFavorites();
        emit(const AddToFavSuccessState());
      });
    });
  }

  void removeFavorites({required int productId}) {
    emit(RemoveFromFavLoadingState());
    favoritesRepo.removeFavorite(productId: productId).then((value) {
      value.fold((failure) {
        log(failure.errMessage.toString());
        emit(RemoveFromFavErrorState(
          error: failure.errMessage.toString(),
        ));
      }, (response) async {
        favoritId.remove(productId);
        getFavorites();
        emit(const RemoveFromFavSuccessState());
      });
    });
  }
}
