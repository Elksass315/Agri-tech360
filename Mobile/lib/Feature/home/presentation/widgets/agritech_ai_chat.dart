import 'package:flutter/material.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class AgriteachAiChat extends StatelessWidget {
  const AgriteachAiChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Agri-tech360 Ai Chat',
              style: AppStyle.font22BlackBold,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: GestureDetector(
                onTap: () {
                  context.navigateTo(
                    routeName: Routes.chatViewRoute,
                  );
                },
                child: Container(
                  width: 35,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorManger.whiteColor.withOpacity(0.7),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
              ),
            )
          ],
        ),
        verticalSpacing(8),
        Text(
          'Hi I am "Agri-tech360" Ai assistant to answer your questions related to the plants ,soil or anything related to agriculture',
          style: AppStyle.font12Greyregular,
        ),
      ],
    );
  }
}
