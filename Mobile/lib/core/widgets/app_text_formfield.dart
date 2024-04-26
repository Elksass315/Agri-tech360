import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    required this.hintText,
    this.maxLine = 1,
    this.filled,
    this.fillColor,
    this.controller,
    required this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.decoration,
  });

  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String hintText;
  final int? maxLine;
  final bool obscureText;
  final bool? filled;
  final TextEditingController? controller;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16)
          .copyWith(top: 12, bottom: 8),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        maxLines: maxLine ?? 1,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 16),
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        validator: validator,
        decoration: decoration ??
            InputDecoration(
              suffixIcon: suffixIcon,
              suffixIconColor: const Color.fromARGB(255, 101, 98, 98),
              prefixIcon: prefixIcon,
              filled: true,
              fillColor: ColorManger.lightMoreGreyColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: ColorManger.lightMoreGreyColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: ColorManger.primaryColor,
                ),
              ),
              errorBorder: buildOutlineInputBorder(
                width: 2,
              ),
              focusedErrorBorder: buildOutlineInputBorder(
                width: 2,
              ),
              hintText: hintText,
              hintStyle: AppStyle.font13LightGreyregular,
            ),
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder({required double width}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide(
      width: width,
      color: ColorManger.primaryColor,
    ),
  );
}
