part of 'explor_cubit.dart';

sealed class ExplorState extends Equatable {
  const ExplorState();

  @override
  List<Object> get props => [];
}

final class ExplorInitial extends ExplorState {}

final class GetPlantDataLoadingState extends ExplorState {}

final class GetPlantDataErrorState extends ExplorState {
  final String errormassage;

  const GetPlantDataErrorState({required this.errormassage});
}

final class GetPlantDataSuccessState extends ExplorState {
  final List<PlantModle> plants;

  const GetPlantDataSuccessState({required this.plants});
}
