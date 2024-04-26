import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> loginUser({
    required String email,
    required String password,
  });

  // Future<Either<Failure, BagAuthModel>> loginWithGoogle();
}
