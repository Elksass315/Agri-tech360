import 'package:flutter/material.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class GetBackArrow extends StatelessWidget {
  const GetBackArrow({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => context.pop(),
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: ColorManger.blackColor,
        size: 20,
      ),
    );
  }
}
