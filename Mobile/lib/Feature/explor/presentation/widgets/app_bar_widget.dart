import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyle.font16Whitebold,
    );
  }
}
