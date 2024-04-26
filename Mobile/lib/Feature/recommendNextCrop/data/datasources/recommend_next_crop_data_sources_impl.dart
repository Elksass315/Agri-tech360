import 'dart:io';

import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/datasources/recommend_next_crop_data_sources.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/models/next_crop_model.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class RecommendNextCropDataSourcesImpl extends RecommendNextCropDataSources {
  @override
  Future<NextCropModel> getNextCropData(
      {required File image, required String previousCrop}) async {
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
    final recommNextCropResponse = NextCropModel.fromJson(response);
    return recommNextCropResponse;
  }
}
