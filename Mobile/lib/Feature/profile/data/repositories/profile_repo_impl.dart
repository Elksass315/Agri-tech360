import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/profile/data/repositories/profile_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';
import 'package:smartsoil/core/helper/local_services.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';

class ProfileRepoImpl implements ProfileRepo {

  ProfileRepoImpl();
  @override
  Future<Either<Failure, UserModel>> getProfileData() async {
    try {
  String token = LocalServices.getData(key: 'token');
    var response = await ApiServices.getData(
      endpoint: userDataendpoint,
      token: token,
    );
    UserModel user = UserModel.fromJson(response);

    return right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateProfile({
    required String fullName,
    required String city,
    required String phoneNumber,
  }) async {
    try {
     String token = LocalServices.getData(key: 'token');

    FormData formData = FormData.fromMap({
      'fullName': fullName,
      'city': city,
      'phoneNumber': phoneNumber,
    });

    var response = await ApiServices.put(
      url: updateuserdataendpoint,
      token: token,
      body: formData,
    );
    UserModel user = UserModel.fromJson(response.data);

      return right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String password,
    required String oldpassword,
  }) async {
    try {
       String token = LocalServices.getData(key: 'token');

    FormData formData = FormData.fromMap({
      'old_password': oldpassword,
      'new_password': password,
    });

    await ApiServices.put(
      url: updatepasswordendpoint,
      token: token,
      body: formData,
    );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
