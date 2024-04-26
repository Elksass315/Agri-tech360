import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class DonotHaveAcoundAndSignUp extends StatelessWidget {
  const DonotHaveAcoundAndSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: AppStyle.font12Blackmedium,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign Up',
            style: AppStyle.font13PrimaryBold.copyWith(
              color: ColorManger.primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
