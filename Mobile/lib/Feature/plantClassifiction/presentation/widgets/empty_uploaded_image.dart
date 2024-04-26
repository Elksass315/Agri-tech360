import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/custom_bottom_sheet.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class EmptyUploadedImage extends StatelessWidget {
  const EmptyUploadedImage({
    super.key,
    required this.cubit,
  });
  final PlantClassfictionCubite cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: ColorManger.whiteColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return CustomBottomSheet(cubit: cubit);
                    });
              },
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: ColorManger.whiteColor,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    ImagesAssetsManger.uploadImage,
                  ),
                  backgroundColor: Colors.transparent,
                  radius: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 55.h,
                ),
                Text(
                  'Upload your plant photo Please',
                  style: AppStyle.font16blacksemibold,
                ),
                Divider(
                  height: 35.h,
                  thickness: 1.1,
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.h,
                      ),
                      Image.asset(
                        'assets/images/about_plant.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        'About this palnt',
                        style: AppStyle.font16blackmedium,
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 35.h,
                  thickness: 1.1,
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.h,
                      ),
                      Image.asset(
                        'assets/images/teratment.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        'Treatment',
                        style: AppStyle.font16blackmedium,
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 35.h,
                  thickness: 1.1,
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.h,
                      ),
                      Image.asset(
                        'assets/images/sunlight.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        'Sunlight',
                        style: AppStyle.font16blackmedium,
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 35.h,
                  thickness: 1.1,
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.h,
                      ),
                      Image.asset(
                        'assets/images/water.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        'Watering',
                        style: AppStyle.font16blackmedium,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
