import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/core/widgets/popular_card.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/custom_error_widget.dart';

class RecntlyViewedContent extends StatelessWidget {
  const RecntlyViewedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExplorCubit, ExplorState>(
      builder: (context, state) {
        ExplorCubit cubit = ExplorCubit.getObject(context);
        final List<PlantModle> shuffledPlants = List.of(cubit.plantsresult)
          ..shuffle();
        if (state is GetPlantDataSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Recently viewed'),
            ),
            body: FadeInUp(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 16.h,
                  right: 27.w,
                  left: 14.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacing(24),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        clipBehavior: Clip.none,
                        itemCount: min(
                          15,
                          shuffledPlants.length,
                        ),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 16.w, top: 28.h),
                            child: PopularCard(
                              plant: shuffledPlants[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is GetPlantDataErrorState) {
          return CustomErrorWidget(
            error: state.errormassage,
            onPressed: () => cubit.getPlants(),
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
