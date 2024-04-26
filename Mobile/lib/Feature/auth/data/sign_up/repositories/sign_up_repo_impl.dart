import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class SignUpRepoImpl extends SignUpRepo {
  @override
  Future<Either<Failure, UserModel>> signUpUser({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
    required String city,
    required File profilePic,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'profilePic': await MultipartFile.fromFile(
          profilePic.path,
          filename: 'photo_${DateTime.now().millisecondsSinceEpoch}.jpg',
          // contentType: MediaType('image', 'jpg'),
        ),
        'email': email,
        'password': password,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'city': city,
      });

      var response = await ApiServices.postFormData(
        endpoint: registerendPoint,
        formData: formData,
      );

      final UserModel user = UserModel.fromJson(response);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
