import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/Feature/explor/domain/repositories/explor_repo.dart';
part 'explor_state.dart';

class ExplorCubit extends Cubit<ExplorState> {
  ExplorCubit({required this.explorRepo}) : super(ExplorInitial());
  final ExplorRepo explorRepo;
  static ExplorCubit getObject(context) =>
      BlocProvider.of<ExplorCubit>(context);

  List<PlantModle> plantsresult = <PlantModle>[];

  Future<void> savePlantDataToLocal(List<PlantModle> plants) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = plants.map((plant) => plant.toJson()).toList();
    prefs.setString('plantsData', json.encode(jsonData));
  }

  Future<List<PlantModle>> loadPlantsDataFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('plantsData');
    if (jsonString != null) {
      final jsonData = json.decode(jsonString);
      return jsonData
          .map<PlantModle>((plant) => PlantModle.fromJson(plant))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> getPlants() async {
    emit(GetPlantDataLoadingState());
    try {
      final localPlantData = await loadPlantsDataFromLocal();

      if (localPlantData.isNotEmpty) {
        plantsresult = localPlantData;
        emit(GetPlantDataSuccessState(plants: plantsresult));
      } else {
        final plantEither = await explorRepo.getPlantsData();
        plantEither.fold(
          (failure) {
            emit(GetPlantDataErrorState(errormassage: failure.errMessage));
          },
          (plant) async {
            plantsresult = plant;
            emit(GetPlantDataSuccessState(plants: plantsresult));
            await savePlantDataToLocal(plant);
          },
        );
      }
    } catch (e) {
      emit(GetPlantDataErrorState(errormassage: e.toString()));
    }
  }
}
