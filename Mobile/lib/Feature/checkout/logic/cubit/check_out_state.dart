part of 'check_out_cubit.dart';

sealed class CheckOutState {}

final class CheckOutInitial extends CheckOutState {}

final class CheckOutLoading extends CheckOutState {}

final class CheckOutSuccess extends CheckOutState {}

final class CheckOutError extends CheckOutState {
  final String error;
  CheckOutError(this.error);
}

final class LunchWhatsAppLoading extends CheckOutState {}

final class LunchWhatsAppSuccess extends CheckOutState {}

final class LunchWhatsAppError extends CheckOutState {
  final String error;
  LunchWhatsAppError({required this.error});
}


final class LunchPhoneLoading extends CheckOutState {}

final class LunchPhoneSuccess extends CheckOutState {}

final class LunchPhoneError extends CheckOutState {
  final String error;
  LunchPhoneError({required this.error});
}


