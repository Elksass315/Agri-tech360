import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/Feature/explor/data/repositories/explor_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';
import 'package:smartsoil/core/helper/local_services.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';

class ExplorRepoImpl extends ExplorRepo {

  ExplorRepoImpl();

  @override
  Future<Either<Failure, List<PlantModle>>> getPlantsData() async {
    try {
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
      // List<PlantModle> plant = await explorDataSources.getPlantsData();
      return right(plants);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<PlantModle>>> getExplorFormLocalDatabase() async {
    try {
      List<PlantModle> crews =
          await LocalServices.getModelFromLocalDatabase<PlantModle>(
              'ExplorData', (data) => PlantModle.fromJson(data));
      return Right(crews);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PlantModle>>> saveExplorToLocalDatabase(
      List<PlantModle> crews) async {
    try {
      await LocalServices.saveModelToLocalDatabase('ExplorData', crews);
      return Right(crews);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
