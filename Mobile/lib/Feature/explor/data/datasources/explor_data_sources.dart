import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';

abstract class ExplorDataSources {
  Future<List<PlantModle>> getPlantsData();
}
