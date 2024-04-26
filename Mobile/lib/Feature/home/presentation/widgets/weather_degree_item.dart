import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class WeatherDegreeItem extends StatelessWidget {
  const WeatherDegreeItem({
    super.key,
    required this.weatherModels,
  });
  final WeatherModel weatherModels;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 6.w,
          ),
          child: Column(
            children: [
              Container(
                width: 95.w,
                height: 110.h,
                decoration: BoxDecoration(
                  color: ColorManger.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManger.greyColor.withOpacity(0.12),
                      spreadRadius: 1,
                      blurRadius: 22,
                      offset: const Offset(3, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 16.w,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          weatherModels.date,
                          style: AppStyle.font12Blackmedium.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      verticalSpacing(6),
                      Expanded(
                        flex: 2,
                        child: Image.network(
                          weatherModels.icon,
                          fit: BoxFit.cover,
                          scale: 1.7,
                        ),
                      ),
                      verticalSpacing(8),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_upward,
                              size: 16,
                            ),
                            horizontalSpacing(2),
                            Expanded(
                              child: Text(
                                '${weatherModels.maxTemp}',
                                style: AppStyle.font12Blackregular,
                              ),
                            )
                          ],
                        ),
                      ),
                      verticalSpacing(4),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_downward,
                              size: 16,
                            ),
                            horizontalSpacing(2),
                            Expanded(
                              child: Text(
                                '${weatherModels.minTemp}',
                                style: AppStyle.font12Blackregular,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
