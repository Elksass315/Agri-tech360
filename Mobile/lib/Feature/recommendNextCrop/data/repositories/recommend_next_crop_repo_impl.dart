import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/datasources/recommend_next_crop_data_sources.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/models/next_crop_model.dart';
import 'package:smartsoil/Feature/recommendNextCrop/domain/repositories/recommend_next_crop_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class RecommendNextCropRepoImpl extends RecommendNextCropRepo {
  final RecommendNextCropDataSources recommendNextCropDataSources;

  RecommendNextCropRepoImpl({required this.recommendNextCropDataSources});

  @override
  Future<Either<Failure, NextCropModel>> getNextCropData(
      {required File image, required String previousCrop}) async {
    try {
      final plantResponseModel =
          await recommendNextCropDataSources.getNextCropData(
        image: image,
        previousCrop: previousCrop,
      );
      return right(plantResponseModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
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
}
