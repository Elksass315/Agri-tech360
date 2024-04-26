import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/profile/data/datasources/profile_data_sources.dart';
import 'package:smartsoil/Feature/profile/domain/repositories/profile_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSources profileDataSources;

  ProfileRepoImpl({required this.profileDataSources});
  @override
  Future<Either<Failure, UserModel>> getProfileData() async {
    try {
      final response = await profileDataSources.getUserData();
      return right(response);
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
      final response = await profileDataSources.updateProfile(
        city: city,
        fullName: fullName,
        phoneNumber: phoneNumber,
      );
      return right(response);
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
      await profileDataSources.changePassword(
        oldpassword: oldpassword,
        password: password,
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
