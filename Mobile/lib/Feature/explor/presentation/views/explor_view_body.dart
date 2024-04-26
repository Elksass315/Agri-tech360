import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/app_bar_widget.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/explor_plant_info_body.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/custom_error_widget.dart';

class ExplorViewBody extends StatefulWidget {
  const ExplorViewBody({Key? key}) : super(key: key);

  @override
  State<ExplorViewBody> createState() => _ExplorViewBodyState();
}

class _ExplorViewBodyState extends State<ExplorViewBody> {
  bool isTreatmentSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExplorCubit, ExplorState>(builder: (context, state) {
      ExplorCubit cubit = ExplorCubit.getObject(context);
      if (state is GetPlantDataLoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: ColorManger.primaryColor,
          ),
        );
      } else if (state is GetPlantDataSuccessState) {
        return BlocBuilder<ExplorCubit, ExplorState>(
          builder: (context, state) {
            final cubit = ExplorCubit.getObject(context);
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 140.h,
                        decoration: const BoxDecoration(
                          color: ColorManger.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpacing(10),
                              const AppBarWidget(title: 'Find your Plant'),
                              verticalSpacing(50),
                              ExplorPlantInfoBody(cubit: cubit),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
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
    });
  }
}
