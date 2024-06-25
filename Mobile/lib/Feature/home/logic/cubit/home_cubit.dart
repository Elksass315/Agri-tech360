import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/Feature/home/data/repositories/home_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  static HomeCubit getObject(context) => BlocProvider.of<HomeCubit>(context);

  final HomeRepo homeRepo;

  List<WeatherModel> weatherResult = <WeatherModel>[];

  Future<void> saveWeatherDataToLocal(List<WeatherModel> weatherData) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = weatherData.map((weather) => weather.toJson()).toList();
    prefs.setString('weatherData', json.encode(jsonData));
  }

  Future<List<WeatherModel>> loadWeatherDataFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('weatherData');
    if (jsonString != null) {
      final jsonData = json.decode(jsonString);
      return jsonData
          .map<WeatherModel>((weather) => WeatherModel.fromJson(weather))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> getWeather() async {
    emit(GetweatherDataLoadingState());

    try {
      final localWeatherData = await loadWeatherDataFromLocal();

      if (localWeatherData.isNotEmpty) {
        weatherResult = localWeatherData;
        emit(GetweatherDataSuccessState(weatherModel: weatherResult));
      } else {
        final weatherEither = await homeRepo.getWeather();
        weatherEither.fold(
          (failure) {
            emit(GetweatherDataErrorState(errormassage: failure.errMessage));
          },
          (weather) async {
            weatherResult = weather;
            emit(GetweatherDataSuccessState(weatherModel: weatherResult));
            await saveWeatherDataToLocal(weather);
          },
        );
      }
    } catch (e) {
      emit(GetweatherDataErrorState(errormassage: e.toString()));
    }
  }
}
