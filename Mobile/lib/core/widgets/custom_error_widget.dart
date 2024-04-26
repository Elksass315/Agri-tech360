import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.onPressed,
    required this.error,
  });

  final VoidCallback onPressed;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Spacer(
          flex: 5,
        ),
        Icon(
          Icons.refresh,
          color: ColorManger.primaryColor,
          size: 150.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12.h),
          child: Flexible(
            child: Text(
              error == 'No Internet Connection' ? '$error. Tap to try' : error,
              style: AppStyle.font10Greyregular.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        if (error == 'No Internet Connection')
          Text(
            'Connect to the internet and try again.',
            style: AppStyle.font12Blackmedium,
            textAlign: TextAlign.center,
          ),
        const Spacer(
          flex: 3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              'Try Again',
              style: AppStyle.font14Blacksemibold,
            ),
          ),
        ),
        const Spacer(
          flex: 5,
        ),
        const Row(
          children: [],
        )
      ],
    );
  }
}
