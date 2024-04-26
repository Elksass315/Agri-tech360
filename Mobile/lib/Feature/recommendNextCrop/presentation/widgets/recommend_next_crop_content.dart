import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/models/next_crop_model.dart';
import 'package:smartsoil/Feature/recommendNextCrop/logic/recommend_next_crop_cubit.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class RecommendNextCropContent extends StatelessWidget {
  const RecommendNextCropContent({
    Key? key,
    required this.nextCropModel,
  }) : super(key: key);
  final NextCropModel nextCropModel;

  @override
  Widget build(BuildContext context) {
    final image = BlocProvider.of<RecommendNextCropCubit>(context).image;

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        width: double.infinity,
        height: 360.h,
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
              child: CircleAvatar(
                radius: 62,
                backgroundColor: ColorManger.whiteColor,
                child: CircleAvatar(
                  backgroundImage: image != null
                      ? NetworkImage('$baseUrl${nextCropModel.data!.image}')
                      : null,
                  backgroundColor: Colors.transparent,
                  radius: 44,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    nextCropModel.data!.soilType!,
                    style: AppStyle.font16blacksemibold,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Previous Crop:',
                      style: AppStyle.font14blackmedium,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        nextCropModel.data!.previousCrop!,
                        style: AppStyle.font12Greymedium,
                      ),
                    ),
                  ),
                  verticalSpacing(5),
                  Divider(
                    height: 5.h,
                    thickness: 0.5,
                  ),
                  verticalSpacing(5),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Recommended Crop:',
                      style: AppStyle.font14blackmedium,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        nextCropModel.data!.recommendedCrop!,
                        style: AppStyle.font12Greymedium,
                      ),
                    ),
                  ),
                  verticalSpacing(5),
                  Divider(
                    height: 5.h,
                    thickness: 0.5,
                  ),
                  verticalSpacing(5),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Season:',
                      style: AppStyle.font14blackmedium,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Expanded(
                    flex: 0,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        nextCropModel.data!.season!,
                        style: AppStyle.font12Greymedium,
                      ),
                    ),
                  ),
                  verticalSpacing(5),
                  Divider(
                    height: 5.h,
                    thickness: 0.5,
                  ),
                  verticalSpacing(5),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Soil type:',
                      style: AppStyle.font14blackmedium,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        nextCropModel.data!.soilType!,
                        style: AppStyle.font12Greymedium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
