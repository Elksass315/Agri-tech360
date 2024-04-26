import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class LineBackGround extends StatelessWidget {
  const LineBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          width: 120.w,
          height: double.infinity,
          color: ColorManger.lightpinkColor,
        ),
      ],
    );
  }
}
