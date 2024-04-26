import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/profile/logic/cubit/profile_cubit.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';
import 'package:smartsoil/core/widgets/app_text_formfield.dart';

class UpdateProfileForm extends StatelessWidget {
  const UpdateProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProfileCubit>(context);
    return FadeInLeft(
      child: Form(
        child: Column(
          children: [
            CustomTextFormFiled(
              controller: cubit.fullNameController,
              hintText: 'Full name ',
              obscureText: false,
            ),
            CustomTextFormFiled(
              controller: cubit.cityController,
              hintText: 'City',
              obscureText: false,
            ),
            CustomTextFormFiled(
              controller: cubit.phonecontroller,
              hintText: 'Phone number',
              obscureText: false,
            ),
            verticalSpacing(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomBottom(
                onPressed: () {
                  cubit.updateProfileData(
                    fullName: cubit.fullNameController.text,
                    city: cubit.cityController.text,
                    phoneNumber: cubit.phonecontroller.text,
                  );
                },
                bottomtext: 'Update',
                backgroundColor: ColorManger.primaryColor,
                bottomHeight: 45.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
