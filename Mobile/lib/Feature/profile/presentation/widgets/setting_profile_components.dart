import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/Custom_list_tittle.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';

class SettingProfileComponents extends StatelessWidget {
  const SettingProfileComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTittle(
          title: const Text('Night Mode'),
          trailing: const Icon(Icons.arrow_right),
          leading: Image.asset(
            ImagesAssetsManger.applogoBlack,
            width: 30.w,
            height: 30.h,
          ),
        ),
        CustomListTittle(
          title: const Text('language'),
          trailing: const Icon(Icons.arrow_right),
          leading: Image.asset(
            ImagesAssetsManger.applogoBlack,
            width: 30.w,
            height: 30.h,
          ),
        ),
      ],
    );
  }
}
