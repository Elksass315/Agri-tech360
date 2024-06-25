part of 'recommend_next_crop_cubit.dart';

sealed class RecommendNextCropState extends Equatable {
  const RecommendNextCropState();

  @override
  List<Object> get props => [];
}

final class RecommendNextCropInitial extends RecommendNextCropState {}

final class UploadImageFromGallerySucsessState extends RecommendNextCropState {
  final File image;

  const UploadImageFromGallerySucsessState({required this.image});
}

final class UploadImageErrorState extends RecommendNextCropState {
  final String errorMessage;

  const UploadImageErrorState({required this.errorMessage});
}

final class UploadImageFromCameraSucsessState extends RecommendNextCropState {
  final File image;

  const UploadImageFromCameraSucsessState({required this.image});
}

final class UploadAndGetResponseToModelSucsesState
    extends RecommendNextCropState {
  final NextCropModel nextCropModel;

  const UploadAndGetResponseToModelSucsesState({required this.nextCropModel});
}

final class UploadAndGetResponseToModelLoadingState
    extends RecommendNextCropState {}

final class UploadAndGetResponseToModelErrorState
    extends RecommendNextCropState {
  final String errorMessage;

  const UploadAndGetResponseToModelErrorState({required this.errorMessage});
}