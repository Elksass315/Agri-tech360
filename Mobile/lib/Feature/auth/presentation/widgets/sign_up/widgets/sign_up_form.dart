import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/auth/logic/sign_up_cubite/sign_up_cubit.dart';
import 'package:smartsoil/core/helper/validators_helper.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_text_formfield.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String errorMessage = '';
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    var signupCubite = context.read<SignUpCubit>();
    return Form(
      key: signupCubite.formKey,
      autovalidateMode: signupCubite.autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0.w),
            child: Text(
              'Full Name',
              style: AppStyle.font14lightblacksemibold,
            ),
          ),
          CustomTextFormFiled(
            obscureText: false,
            hintText: 'Name',
            keyboardType: TextInputType.text,
            controller: signupCubite.nameController,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Email',
                style: AppStyle.font14lightblacksemibold,
              )),
          CustomTextFormFiled(
            obscureText: false,
            hintText: 'Patient@self.com',
            keyboardType: TextInputType.emailAddress,
            controller: signupCubite.emailController,
            validator: (text) {
              return MyValidatorsHelper.emailValidator(text);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Password',
              style: AppStyle.font14lightblacksemibold,
            ),
          ),
          CustomTextFormFiled(
            obscureText: isPasswordShow,
            suffixIcon: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  isPasswordShow = !isPasswordShow;
                });
              },
              child: isPasswordShow
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            hintText: 'Min 8 Cyfr',
            keyboardType: TextInputType.visiblePassword,
            controller: signupCubite.passwordController,
            validator: (text) {
              return MyValidatorsHelper.passwordValidator(text);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Phone',
              style: AppStyle.font14lightblacksemibold,
            ),
          ),
          CustomTextFormFiled(
            obscureText: false,
            hintText: 'Phone',
            keyboardType: TextInputType.phone,
            controller: signupCubite.phoneController,
            validator: (text) {
              return MyValidatorsHelper.phoneValidator(text);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'City',
              style: AppStyle.font14lightblacksemibold,
            ),
          ),
          CustomTextFormFiled(
            obscureText: false,
            hintText: 'City Name',
            keyboardType: TextInputType.text,
            controller: signupCubite.cityController,
            validator: (text) {
              return MyValidatorsHelper.cityValidator(text);
            },
          ),
        ],
      ),
    );
  }
}
