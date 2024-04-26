part of 'favorites_cubit.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesState {}

class GetFavoritesLoadingState extends FavoritesState {
  const GetFavoritesLoadingState();
}

class GetFavoritesSuccessState extends FavoritesState {
  final List<FavoriteData> favorites;

  const GetFavoritesSuccessState({required this.favorites});

  @override
  List<Object> get props => [favorites];
}

class GetFavoritesErrorState extends FavoritesState {
  final String error;

  const GetFavoritesErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class AddToFavLoadingState extends FavoritesState {}

class AddToFavErrorState extends FavoritesState {
  final String error;

  const AddToFavErrorState({required this.error});
  }


class AddToFavSuccessState extends FavoritesState {
  const AddToFavSuccessState();
}


class RemoveFromFavLoadingState extends FavoritesState {}

class RemoveFromFavErrorState extends FavoritesState {
  final String error;

  const RemoveFromFavErrorState({required this.error}); 
  }


class RemoveFromFavSuccessState extends FavoritesState {
  const RemoveFromFavSuccessState();
}