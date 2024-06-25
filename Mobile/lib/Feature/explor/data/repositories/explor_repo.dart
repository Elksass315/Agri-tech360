import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class ExplorRepo {
  Future<Either<Failure, List<PlantModle>>> getPlantsData();
  Future<Either<Failure, List<PlantModle>>> saveExplorToLocalDatabase(
    List<PlantModle> crews,
  );
  Future<Either<Failure, List<PlantModle>>> getExplorFormLocalDatabase();
}
