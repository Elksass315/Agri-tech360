// ignore_for_file: unnecessary_null_comparison

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/logic/cubit/home_cubit.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/weather_degree_item.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/custom_error_widget.dart';

class WeatherDegreeListView extends StatelessWidget {
  const WeatherDegreeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.getObject(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetweatherDataLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManger.primaryColor,
            ),
          );
        } else if (cubit.weatherResult != null) {
          return FadeInLeft(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily Forecast',
                  style: AppStyle.font22BlackBold,
                ),
                verticalSpacing(24),
                SizedBox(
                  height: 115.h,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: cubit.weatherResult.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(
                            right: 16.w,
                          ),
                          child: WeatherDegreeItem(
                            weatherModels: cubit.weatherResult[index],
                          ));
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetweatherDataErrorState) {
          return CustomErrorWidget(
            error: state.errormassage,
            onPressed: () => cubit.getWeather(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManger.primaryColor,
            ),
          );
        }
      },
    );
  }
}
