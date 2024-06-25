import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/models/next_crop_model.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/repositories/recommend_next_crop_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';
import 'package:smartsoil/core/helper/local_services.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';

class RecommendNextCropRepoImpl extends RecommendNextCropRepo {

  RecommendNextCropRepoImpl();

  @override
  Future<Either<Failure, NextCropModel>> getNextCropData(
      {required File image, required String previousCrop}) async {
    try {
      String token = await LocalServices.getData(key: 'token');
      final formData = FormData.fromMap(
        {
          'file': await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          ),
          'previous_crop': previousCrop,
        },
      );
      final headers = {
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data",
      };

      final response = await ApiServices.postData(
        endpoint: recommendcropendpoint,
        data: formData,
        options: Options(
          headers: headers,
        ),
      );
      final plantResponseModel = NextCropModel.fromJson(response);

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
