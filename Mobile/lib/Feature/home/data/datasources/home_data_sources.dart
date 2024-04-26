import 'package:smartsoil/Feature/home/data/models/weather_model.dart';

abstract class HomeDataSource {
  Future<List<WeatherModel>> getWeatherData();
}
