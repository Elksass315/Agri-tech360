part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileErrorState extends ProfileState {
  final String error;
  const ProfileErrorState({required this.error});
}

final class ProfileSuccessState extends ProfileState {
  final UserModel userData;
  const ProfileSuccessState({required this.userData});
}

final class UpdateProfileLoadingState extends ProfileState {}

final class UpdateProfileErrorState extends ProfileState {
  final String error;
  const UpdateProfileErrorState({required this.error});
}

final class UpdateProfileSuccessState extends ProfileState {
  final UserModel userUpdatedModel;
  const UpdateProfileSuccessState({required this.userUpdatedModel});
}

final class ChangePasswordLoadingState extends ProfileState {}

final class ChangePasswordErrorState extends ProfileState {
  final String error;
  const ChangePasswordErrorState({required this.error});
}

final class ChangePasswordSuccessState extends ProfileState {}
