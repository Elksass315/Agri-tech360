import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class HealYourCropAndPlantText extends StatelessWidget {
  const HealYourCropAndPlantText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Heal your crop',
          style: AppStyle.font22BlackBold,
        ),
        verticalSpacing(8),
        Text(
          'it leaf classification app uses cutting-edge technology to identify various types of leaves accurately. It\'s perfect for botanists and nature enthusiasts',
          style: AppStyle.font12Greyregular,
        ),
        verticalSpacing(16),
        Container(
          padding: const EdgeInsets.all(16),
          width: 343.w,
          height: 186.h,
          decoration: BoxDecoration(
            color: ColorManger.whiteColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: ColorManger.greyColor.withOpacity(0.2),
                spreadRadius: 2.5,
                blurRadius: 15,
                offset: const Offset(3, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          ImagesAssetsManger.cameraImage,
                          width: 52.w,
                          height: 52.h,
                        ),
                        verticalSpacing(8),
                        const Text(
                          'Take a\npicture',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 19,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          ImagesAssetsManger.phoneImage,
                          width: 52.w,
                          height: 52.h,
                        ),
                        verticalSpacing(8),
                        const Text(
                          'Get the\nresult',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 19,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          ImagesAssetsManger.diagnosisImage,
                          width: 52.w,
                          height: 52.h,
                        ),
                        verticalSpacing(8),
                        const Text(
                          'Get \ndiagnosis',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpacing(16),
              Expanded(
                child: CustomBottom(
                  backgroundColor: ColorManger.primaryColor,
                  bottomtext: 'Heal Your Crops',
                  onPressed: () {
                    context.navigateTo(routeName: Routes.plantCareViewRoute);
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
