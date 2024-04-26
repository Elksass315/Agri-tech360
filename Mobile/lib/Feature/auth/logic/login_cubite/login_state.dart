part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSucess extends LoginState {
  final UserModel loginModel;

  LoginSucess({required this.loginModel});
}

final class LoginLoading extends LoginState {}

final class LoginErorr extends LoginState {
  final String error;

  LoginErorr({required this.error});
}

final class LoginChangePasswordVisiablity extends LoginState {}
