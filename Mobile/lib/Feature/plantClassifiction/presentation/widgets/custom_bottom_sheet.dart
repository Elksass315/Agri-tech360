// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.cubit,
  });

  final PlantClassfictionCubite cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: const BoxDecoration(
          color: ColorManger.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          children: [
            Text(
              'Upload Image from',
              style: AppStyle.font16Blackmedium.copyWith(
                fontFamily: 'Poppins',
              ),
            ),
            verticalSpacing(20),
            Expanded(
              child: CustomBottom(
                bottomWidth: 330.w,
                onPressed: () async {
                  await cubit.uploadImageFromGalleryModel(
                    picke: ImagePicker(),
                  );
                  context.pop();
                  await cubit.uploadImageToModel(image: cubit.image!);
                },
                bottomtext: 'Select From Gallary',
                backgroundColor: ColorManger.primaryColor,
              ),
            ),
            verticalSpacing(20),
            Expanded(
              child: CustomBottom(
                bottomWidth: 330.w,
                onPressed: () async {
                  await cubit.uploadImageFromCameraModel(
                    picke: ImagePicker(),
                  );
                  context.pop();
                  await cubit.uploadImageToModel(image: cubit.image!);
                },
                bottomtext: 'Open Camera',
                backgroundColor: ColorManger.primaryColor,
              ),
            ),
            verticalSpacing(20),
          ],
        ),
      ),
    );
  }
}
