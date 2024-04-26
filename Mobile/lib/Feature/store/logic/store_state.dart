part of 'store_cubit.dart';

sealed class StoreState extends Equatable {
  const StoreState();

  @override
  List<Object> get props => [];
}

final class StoreInitial extends StoreState {}

final class StoreGetProductsLoading extends StoreState {}

final class StoreGetProductsSuccess extends StoreState {
  final List<StoreProductModel> products;

  const StoreGetProductsSuccess({required this.products});
}

final class StoreGetProductsError extends StoreState {
  final String error;

  const StoreGetProductsError({required this.error});
}

class StoreImageRemoved extends StoreState {}

class StoreImageAdded extends StoreState {}

class StoreAddProductLoading extends StoreState {}

class StoreAddProductSuccess extends StoreState {}

class StoreAddProductError extends StoreState {
  final String error;
  const StoreAddProductError({required this.error});
}
