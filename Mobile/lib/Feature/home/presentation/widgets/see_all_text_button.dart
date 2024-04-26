import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class SeeAllTextButton extends StatelessWidget {
  const SeeAllTextButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        'See all',
        style: AppStyle.font13Blackregular,
      ),
    );
  }
}
