import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class TittleAndSubtittleText extends StatelessWidget {
  const TittleAndSubtittleText({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context
              .read<OnbordingCubit>()
              .onBoardingRepo
              .onBoardingPages()[index]
              .tittle,
          style: AppStyle.font32BlackBold,
        ),
        verticalSpacing(16),
        Text(
          context
              .read<OnbordingCubit>()
              .onBoardingRepo
              .onBoardingPages()[index]
              .subtittle,
          style: AppStyle.font16LightGreymedium,
        ),
      ],
    );
  }
}
