import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<WeatherModel>>> getWeather();
}
