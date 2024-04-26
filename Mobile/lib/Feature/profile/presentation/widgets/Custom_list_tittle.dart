// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomListTittle extends StatelessWidget {
  const CustomListTittle(
      {super.key,
      this.onTap,
      required this.title,
      required this.leading,
      required this.trailing});
  final void Function()? onTap;
  final Widget? title;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: title,
      trailing: trailing,
    );
  }
}
