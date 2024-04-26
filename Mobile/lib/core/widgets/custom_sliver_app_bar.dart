import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/get_back_arrow.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.titleText,
    this.leading,
    this.actions,
    this.centerTitle,
    this.arrowBackOnTap,
    this.title,
  });

  final Widget? title;
  final String? titleText;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final void Function()? arrowBackOnTap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: leading ?? GetBackArrow(onTap: arrowBackOnTap),
      backgroundColor: ColorManger.whiteColor.withOpacity(0.3),
      elevation: 0.0,
      actions: actions,
      centerTitle: centerTitle,
      title: titleText != null
          ? Text(
              titleText!,
              style: AppStyle.font14Blacksemibold,
            )
          : title,
    );
  }
}
