import 'package:smartsoil/Feature/home/data/datasources/home_data_sources.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class HomeDatSourceImpl extends HomeDataSource {
  @override
  Future<List<WeatherModel>> getWeatherData() async {
    String token = await LocalServices.getData(key: 'token');
    Map<String, dynamic> response = await ApiServices.getData(
      endpoint: '$baseUrl$weatherendPoint',
      token: token,
    );

    List<WeatherModel> weather = [];

    if (response.containsKey('data')) {
      for (var weatherMap in response['data']) {
        weather.add(WeatherModel.fromJson(weatherMap));
      }
    }
    return weather;
  }
}
