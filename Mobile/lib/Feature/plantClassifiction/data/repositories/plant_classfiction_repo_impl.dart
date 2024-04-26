import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/datasources/plant_classfiction_data_sources.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/models/classfiction_model.dart';
import 'package:smartsoil/Feature/plantClassifiction/domain/repositories/plant_classfictaion_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class PlantCareRepoImpl extends PlantCareRepo {
  final PlantClassficationDataSource plantClassficationDataSource;

  PlantCareRepoImpl({required this.plantClassficationDataSource});
  @override
  Future<File?> pickedImageFromGallary(ImagePicker picker) async {
    try {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<File?> pickedImageFromCamira(ImagePicker picker) async {
    try {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Either<Failure, ClassfictionModel>> getClassficationData(
      {required File image}) async {
    try {
      final plantResponseModel =
          await plantClassficationDataSource.getClassficationData(image: image);
      return right(plantResponseModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
