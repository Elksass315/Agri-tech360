import 'package:flutter/material.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/networking/local_services.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class LogOutBotton extends StatelessWidget {
  const LogOutBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        LocalServices.removeData(key: 'token');
        context.navigateAndRemoveUntil(
          newRoute: Routes.authViewRoute,
        );
      },
      child: Text(
        'Logout',
        style: AppStyle.font13PrimaryBold
            .copyWith(color: ColorManger.redColor),
      ),
    );
  }
}