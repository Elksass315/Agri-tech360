import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/Custom_list_tittle.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/contact_devloper_bottom_sheet.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';

class GeneralProfileComponents extends StatelessWidget {
  const GeneralProfileComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTittle(
          title: const Text('favorites'),
          leading: Image.asset(
            ImagesAssetsManger.favoritesImage,
            width: 30.w,
            height: 30.h,
          ),
          trailing: GestureDetector(
              onTap: () => {
                    context.navigateTo(
                      routeName: Routes.favoriteContentViewRoute,
                    )
                  },
              child: const Icon(Icons.arrow_right)),
        ),
        CustomListTittle(
          title: const Text('Viewed recently'),
          leading: Image.asset(
            ImagesAssetsManger.recentImage,
            width: 30.w,
            height: 30.h,
          ),
          trailing: GestureDetector(
              onTap: () => {
                    context.navigateTo(
                      routeName: Routes.recentlyViewedContent,
                    )
                  },
              child: const Icon(Icons.arrow_right)),
        ),
        CustomListTittle(
          title: const Text('Contact developer'),
          leading: Image.asset(
            ImagesAssetsManger.recentImage,
            width: 30.w,
            height: 30.h,
          ),
          trailing: GestureDetector(
              onTap: () => {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return const ContactDevloperBottomSheet();
                      },
                    )
                  },
              child: const Icon(Icons.arrow_right)),
        ),
        verticalSpacing(8),
        const Divider(
          color: ColorManger.greyColor,
          height: 1,
        ),
      ],
    );
  }
}
