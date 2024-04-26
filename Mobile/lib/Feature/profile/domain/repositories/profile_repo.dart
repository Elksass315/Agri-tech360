import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> getProfileData();

  Future<Either<Failure, UserModel>> updateProfile({
    required String fullName,
    required String city,
    required String phoneNumber,
  });


  Future<Either<Failure, void>> changePassword({
    required String password,
    required String oldpassword,
  });
}
