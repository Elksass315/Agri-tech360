import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/Feature/explor/data/repositories/explor_repo.dart';
part 'explor_state.dart';

class ExplorCubit extends Cubit<ExplorState> {
  ExplorCubit({required this.explorRepo}) : super(ExplorInitial());
  final ExplorRepo explorRepo;
  static ExplorCubit getObject(context) =>
      BlocProvider.of<ExplorCubit>(context);

  List<PlantModle> plantsresult = <PlantModle>[];
  Future<void> saveExplorDataToLocal(List<PlantModle> plants) async {
    emit(SaveExplorDataToLocalLoadingState());
    var response = await explorRepo.saveExplorToLocalDatabase(plants);
    response.fold((failure) {
      emit(SaveExplorDataToLocalErrorState(error: failure.errMessage));
    }, (success) {
      plantsresult = plants;
      emit(SaveExplorDataToLocalSuccessState(plants: plantsresult));
    });
  }

  Future<List<PlantModle>> loadExplorDataFromLocal() async {
    emit(LoadExplorDataToLocalLoadingState());
    var response = await explorRepo.getExplorFormLocalDatabase();
    return response.fold((failure) {
      emit(LoadExplorDataToLocalErorrState(error: failure.errMessage));
      return [];
    }, (plants) {
      emit(LoadExplorDataToLocalSuccessState(plants: plants));
      return plants;
    });
  }

  Future<void> getPlants() async {
    emit(GetPlantDataLoadingState());
    try {
      final localPlants = await loadExplorDataFromLocal();
      if (localPlants.isNotEmpty) {
        plantsresult = localPlants;
        emit(GetPlantDataSuccessState(plants: plantsresult));
      } else {
        var response = await explorRepo.getPlantsData();
        response.fold((failure) async {
          emit(GetPlantDataErrorState(errormassage: failure.errMessage));
        }, (plants) async {
          plantsresult = plants;
          await saveExplorDataToLocal(
              plants);
          emit(GetPlantDataSuccessState(plants: plants));
        });
      }
    } catch (e) {
      emit(GetPlantDataErrorState(errormassage: e.toString()));
    }
  }
}

