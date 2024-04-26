import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpacing(100),
            Image.asset(
              'assets/images/bag_wish.png',
              height: 350.h,
            ),
            verticalSpacing(20),
            Text(
              'Ooooops!',
              style: AppStyle.font32BlackBold
                  .copyWith(color: ColorManger.redColor),
            ),
            verticalSpacing(20),
            Text(
              'Your favorite list is empty',
              style: AppStyle.font14Blacksemibold.copyWith(fontSize: 15.sp),
            ),
            verticalSpacing(5),
            Text(
              'Please add your favorite Products',
              textAlign: TextAlign.center,
              style: AppStyle.font14Blacksemibold.copyWith(
                fontSize: 15.sp,
              ),
            ),
            verticalSpacing(100),
          ],
        ),
      ),
    );
  }
}
