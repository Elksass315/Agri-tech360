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

final class SaveExplorDataToLocalLoadingState extends ExplorState {}

final class SaveExplorDataToLocalSuccessState extends ExplorState {
  final List<PlantModle> plants;

  const SaveExplorDataToLocalSuccessState({required this.plants});    }

final class SaveExplorDataToLocalErrorState extends ExplorState {
  final String error;
  const SaveExplorDataToLocalErrorState({required this.error});
} 


final class LoadExplorDataToLocalLoadingState extends ExplorState {}


final class LoadExplorDataToLocalSuccessState extends ExplorState {
  final List<PlantModle> plants;
  const LoadExplorDataToLocalSuccessState({required this.plants});
}   

final class LoadExplorDataToLocalErorrState extends ExplorState {
  final String error;
  const LoadExplorDataToLocalErorrState({required this.error});
}

