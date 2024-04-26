import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class Agritech360AppBar extends StatelessWidget {
  const Agritech360AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManger.whiteColor.withOpacity(0.2),
      elevation: 0.0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        'Agri-tech360',
        style: AppStyle.font21PrimaryBold,
      ),
    );
  }
}
