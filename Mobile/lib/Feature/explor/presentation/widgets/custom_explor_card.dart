import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/models/planr_model_class.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class CustomExplorCard extends StatelessWidget {
  const CustomExplorCard({super.key, required this.plant});

  final PlantModle plant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(
        routeName: Routes.plantDetailsViewRoute,
        arguments:
            PlantModelClass(plantModle: plant), // pass data to another screan
      ),
      child: Container(
        width: 250.w,
        height: 160.h,
        decoration: BoxDecoration(
          color: ColorManger.whiteColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 9),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plant.name,
                        style: AppStyle.font14Blacksemibold,
                      ),
                      verticalSpacing(8),
                      Expanded(
                        child: Text(
                          plant.mediumDescription,
                          style: AppStyle.font10Greyregular,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpacing(10),
              Expanded(
                flex: 1,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 0,
                      left: 5,
                      child: CachedNetworkImage(
                        imageUrl: '$baseUrl${plant.plantImage_1}',
                        height: 150.h,
                        width: 80.w,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
