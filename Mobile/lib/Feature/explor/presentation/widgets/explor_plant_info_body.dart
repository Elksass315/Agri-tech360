import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/custom_explor_card.dart';

class ExplorPlantInfoBody extends StatelessWidget {
  const ExplorPlantInfoBody({
    super.key,
    required this.cubit,
  });

  final ExplorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeInLeft(
        duration: const Duration(
          milliseconds: 700,
        ),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 15.h),
          physics: const BouncingScrollPhysics(),
          itemCount: cubit.plantsresult.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomExplorCard(
                plant: cubit.plantsresult[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
