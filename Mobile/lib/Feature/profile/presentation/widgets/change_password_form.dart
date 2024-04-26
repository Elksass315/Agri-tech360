import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/profile/logic/cubit/profile_cubit.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';
import 'package:smartsoil/core/widgets/app_text_formfield.dart';
import 'package:smartsoil/core/widgets/shows_toust_color.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({
    super.key,
    required this.cubit,
  });

  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFiled(
          controller:
              cubit.oldpasswordController,
          hintText: 'Old password',
          obscureText: false,
        ),
        CustomTextFormFiled(
          controller:
              cubit.passwordController,
          hintText: 'New password',
          obscureText: false,
        ),
        CustomTextFormFiled(
          controller: cubit
              .confirmpasswordController,
          hintText: 'Confirm password',
          obscureText: false,
        ),
        verticalSpacing(10),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10.w),
          child: CustomBottom(
            onPressed: () {
              if (cubit
                      .confirmpasswordController
                      .text !=
                  cubit.passwordController
                      .text) {
                showTouster(
                  massage:
                      'Passwords don\'t match',
                  state: ToustState.ERROR,
                );
              } else {
                cubit.changePassword(
                  password: cubit
                      .passwordController
                      .text,
                  oldpassword: cubit
                      .oldpasswordController
                      .text,
                );
              }
            },
            bottomtext: 'Change password',
            backgroundColor:
                ColorManger.primaryColor,
            bottomHeight: 45.h,
          ),
        )
      ],
    );
  }
}