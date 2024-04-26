import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/core/widgets/popular_card.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/see_all_text_button.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/custom_error_widget.dart';

class RecntlyViewedListView extends StatelessWidget {
  const RecntlyViewedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExplorCubit, ExplorState>(
      builder: (context, state) {
        ExplorCubit cubit = ExplorCubit.getObject(context);
        final List<PlantModle> shuffledPlants = List.of(cubit.plantsresult)
          ..shuffle(); 
        if (state is GetPlantDataSuccessState) {
          return FadeInUp(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Recently viewed',
                      style: AppStyle.font22BlackBold,
                    ),
                    const Spacer(),
                    SeeAllTextButton(
                      onTap: () {
                        context.navigateTo(
                          routeName: Routes.recentlySeeAllViewViewRoute,
                        );
                      },
                    )
                  ],
                ),
                verticalSpacing(24),
                SizedBox(
                  height: 100.h,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    itemCount:
                        min(8, shuffledPlants.length), // Limiting to 10 items
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: PopularCard(
                          plant: shuffledPlants[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
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
