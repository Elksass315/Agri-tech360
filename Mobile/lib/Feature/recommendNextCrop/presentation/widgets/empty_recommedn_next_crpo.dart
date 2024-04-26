import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/recommendNextCrop/logic/recommend_next_crop_cubit.dart';
import 'package:smartsoil/Feature/recommendNextCrop/presentation/widgets/custom_plant_recommend_bottom_sheet.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_text_formfield.dart';

class EmptyRecommedNextCrop extends StatelessWidget {
  const EmptyRecommedNextCrop({
    super.key,
    required this.cubit,
  });
  final RecommendNextCropCubit cubit;

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
            right: 50,
            top: -50,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return CustomRecommendBottomSheet(
                        cubit: cubit,
                      );
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Soil Recommendation',
                  style: AppStyle.font16blacksemibold,
                ),
                verticalSpacing(5),
                CustomTextFormFiled(
                  hintText: 'Previous Crop',
                  obscureText: false,
                  controller: cubit.previousCropController,
                ),
                verticalSpacing(20),
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
                        'recommended crop',
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
                        'assets/images/about_plant.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        'season',
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
                        'assets/images/about_plant.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        'soil type',
                        style: AppStyle.font16blackmedium,
                      )
                    ],
                  ),
                ),
                verticalSpacing(30)
              ],
            ),
          )
        ],
      ),
    );
  }
}
