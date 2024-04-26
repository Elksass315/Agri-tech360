import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/card_icon_bottom.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class HellowRow extends StatelessWidget {
  const HellowRow({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good day for shopping',
                  style: AppStyle.font16blackmedium.copyWith(
                    fontFamily: 'Poppins',
                    fontSize: 15.sp,
                    color: ColorManger.whiteColor.withOpacity(0.7),
                  ),
                ),
                Text(
                  'Agri-tech360 Store',
                  style: AppStyle.font22Whitesmedium,
                ),
              ],
            ),
            const Spacer(),
            const CardIconBottom()
          ],
        ),
      ),
    );
  }
}
