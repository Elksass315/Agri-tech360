import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/Feature/home/data/repositories/home_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';
import 'package:smartsoil/core/helper/local_services.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';

class HomeRepooImpl extends HomeRepo {
  HomeRepooImpl();


  @override
  Future<Either<Failure, List<WeatherModel>>> getWeather() async {
    try {

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
        return right(weather);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
