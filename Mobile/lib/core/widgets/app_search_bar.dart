import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    required this.width2,
    this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.onTap,
  });

  final double width2;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width2 * 1,
          height: width2 * .13,
          decoration: BoxDecoration(
              color: ColorManger.whiteColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.grey)),
          child: Row(
            children: [
              horizontalSpacing(15),
              const Icon(
                Iconsax.search_normal,
                color: ColorManger.greyColor,
                size: 22,
              ),
              horizontalSpacing(12),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: TextFormField(
                    enabled: false,
                    controller: controller,
                    onTapOutside: (edgeDraggingAutoScroller) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: InputDecoration(
                      hintText: 'Search in Store',
                      hintStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        color: ColorManger.greyColor,
                      ),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(33),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onFieldSubmitted: onFieldSubmitted,
                    onChanged: onChanged,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
