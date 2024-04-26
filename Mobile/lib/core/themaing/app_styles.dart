import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/font_weight_helper.dart';

class AppStyle {
  // Black Color Styles
  static TextStyle font32blacksemibold = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.semibold,
      color: Colors.black,
      fontFamily: 'Raleway');

  static TextStyle font20blacksemibold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle font16blacksemibold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semibold,
    color: Colors.black,
  );
  static TextStyle font16blackmedium = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.medium,
      color: Colors.black,
      fontFamily: 'Raleway');
  static TextStyle font14blackmedium = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      color: Colors.black,
      fontFamily: 'Raleway');
  static TextStyle font32BlackBold = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.bold,
      color: Colors.black,
      fontFamily: 'Raleway');
  static TextStyle font22BlackBold = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font14Blacksemibold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semibold,
    color: Colors.black,
  );
  static TextStyle font13Blacksemibold = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.semibold,
    color: Colors.black,
    fontFamily: 'Raleway',
  );
  static TextStyle font17Blacksemibold = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeightHelper.semibold,
    color: Colors.black,
  );

  static TextStyle font12Blackmedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
  static TextStyle font14Blackmedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
  static TextStyle font16Blackmedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
  static TextStyle font12Blackregular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );

  static TextStyle font13Blackregular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );
  static TextStyle font14Blackregular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
    letterSpacing: .5,
  );

  static TextStyle font14lightblacksemibold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semibold,
    color: ColorManger.blackColor.withOpacity(0.8),
  );
  static TextStyle font14lightblackmdeium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    height: 1.3,
    wordSpacing: 0.44,
    letterSpacing: .2,
    color: ColorManger.blackColor.withOpacity(0.8),
  );

  static TextStyle font20blackregular = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManger.blackColor,
  );
  static TextStyle font24blakBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManger.blackColor,
  );

  // Grey Color Styles

  static TextStyle font12Greyregular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManger.greyColor,
  );
  static TextStyle font10Greyregular = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManger.greyColor,
  );
  static TextStyle font16LightGreymedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorManger.lightGreyColor,
  );
  static TextStyle font13LightGreyregular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManger.lightGreyColor,
  );
  static TextStyle font14Greyregular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xffA7A6A5),
    fontFamily: 'Raleway',
  );
  static TextStyle font16Greyregular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xffA7A6A5),
    fontFamily: 'Raleway',
  );
  static TextStyle font13Greymedium = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: const Color.fromARGB(255, 146, 144, 143),
    fontFamily: 'Raleway',
  );
  static TextStyle font12Greymedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xff909090),
    fontFamily: 'Raleway',
  );
  // Primary Color Styles
  static TextStyle font14Primarysemibold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorManger.primaryColor,
  );
  static TextStyle font15PrimaryBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManger.primaryColor,
  );
  static TextStyle font13PrimaryBold = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorManger.primaryColor,
  );
  static TextStyle font21PrimaryBold = TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManger.primaryColor,
  );
  static TextStyle font11PrimarySemiBold = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.semibold,
    color: ColorManger.primaryColor,
    fontFamily: 'Raleway',
  );

  // White Color Styles
  static TextStyle font11WhiteSemiBold = TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeightHelper.semibold,
      color: ColorManger.whiteColor,
      fontFamily: 'Raleway');
  static TextStyle font16Whitebold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManger.whiteColor,
    fontFamily: 'Raleway',
  );

  static TextStyle font14Whitesemibold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semibold,
    color: ColorManger.whiteColor,
  );
  static TextStyle font12Whiteregular = TextStyle(
    fontSize: 12.sp,
    color: ColorManger.whiteColor.withOpacity(0.6),
    fontWeight: FontWeight.w400,
    letterSpacing: .3,
  );
  static TextStyle font12Whitebold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManger.whiteColor,
  );
  static TextStyle font12Whitesemibold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.semibold,
    color: ColorManger.whiteColor,
  );
  static TextStyle font21Whitebold = TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManger.whiteColor,
  );
  static TextStyle font22Whitebold = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManger.whiteColor,
  );
  static TextStyle font22Whitesmedium = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorManger.whiteColor,
    fontFamily: 'Poppins',
  );

  static TextStyle font14Whitesemiboldralewayey = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Raleway',
  );
  static TextStyle font14Whiteregular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: 'Raleway',
  );
  static TextStyle font16Whitesemibold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Raleway',
  );
  static TextStyle font18Whitesemibold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Raleway',
  );
}
