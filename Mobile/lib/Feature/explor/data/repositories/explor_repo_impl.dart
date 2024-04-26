import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/explor/data/datasources/explor_data_sources.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/Feature/explor/domain/repositories/explor_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class ExplorRepoImpl extends ExplorRepo {
  final ExplorDataSources explorDataSources;

  ExplorRepoImpl({required this.explorDataSources});

  @override
  Future<Either<Failure, List<PlantModle>>> getPlantsData() async {
    try {
      List<PlantModle> plant = await explorDataSources.getPlantsData();
      return right(plant);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
