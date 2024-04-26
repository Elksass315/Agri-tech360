part of 'plant_classfiction_cubit.dart';

sealed class PlantClasfictionState extends Equatable {
  const PlantClasfictionState();

  @override
  List<Object> get props => [];
}

final class PlantClassfictionInitial extends PlantClasfictionState {}

final class UploadImageFromGallerySucsessState extends PlantClasfictionState {
  final File image;

  const UploadImageFromGallerySucsessState({required this.image});
}

final class UploadImageErrorState extends PlantClasfictionState {
  final String errorMessage;

  const UploadImageErrorState({required this.errorMessage});
}

final class UploadImageFromCameraSucsessState extends PlantClasfictionState {
  final File image;

  const UploadImageFromCameraSucsessState({required this.image});
}

final class UploadAndGetResponseToModelSucsesState
    extends PlantClasfictionState {
  final ClassfictionModel plantCareModle;

  const UploadAndGetResponseToModelSucsesState({required this.plantCareModle});
}

final class UploadAndGetResponseToModelLoadingState
    extends PlantClasfictionState {}

final class UploadAndGetResponseToModelErrorState
    extends PlantClasfictionState {
  final String errorMessage;

  const UploadAndGetResponseToModelErrorState({required this.errorMessage});
}
