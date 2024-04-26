import 'package:smartsoil/Feature/explor/data/datasources/explor_data_sources.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class ExplorDataSourcesImpl extends ExplorDataSources {
  @override
  Future<List<PlantModle>> getPlantsData() async {
    String token = await LocalServices.getData(key: 'token');
    Map<String, dynamic> response = await ApiServices.getData(
      endpoint: '$baseUrl$plantsendPoint',
      token: token,
    );
    List<PlantModle> plants = [];

    if (response.containsKey('data')) {
      for (var plant in response['data']) {
        plants.add(PlantModle.fromJson(plant));
      }
    }
    return plants;
  }
}
