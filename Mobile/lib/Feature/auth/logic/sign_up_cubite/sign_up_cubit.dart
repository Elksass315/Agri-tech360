import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signUpRepo}) : super(SignUpInitial());

  final SignUpRepo signUpRepo;

  void signUpUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String city,
    required File profilePic ,
  }) {
    emit(SignUpLoading());
    signUpRepo
        .signUpUser(
      fullName: name,
      email: email,
      password: password,
      phoneNumber: phone,
      city: city,
      profilePic: profilePic,
    )
        .then((value) {
      value.fold(
        (failure) {
          emit(SignUpError(errorMessage: failure.errMessage));
        },
        (user) {
          emit(SignUpSucess(registerModel: user));
        },
      );
    });
  }
  Future<File?> uploadImageFromGalleryModel({
    required ImagePicker picker,
  }) async {
    try {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        image = File(pickedFile.path);
        emit(UploadImageFromGallerySuccessState(image: pickedFile));
        return image; // Return the image file
      } else {
        emit(const UploadImageErrorState(errorMessage: "No image picked"));
        return null;
      }
    } catch (e) {
      emit(UploadImageErrorState(errorMessage: e.toString()));
      return null;
    }
  }

  File? image;
  var formKey = GlobalKey<FormState>();

  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  bool isPasswordShow = true;

  void changepasswordVisiability() {
    isPasswordShow = !isPasswordShow;
    emit(SignUpChangepasswordvisabilty());
  }
}
