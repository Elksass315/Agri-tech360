import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class SignUpRepo {
  Future<Either<Failure, UserModel>> signUpUser({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
    required String city,
    required File profilePic,
  });
}
