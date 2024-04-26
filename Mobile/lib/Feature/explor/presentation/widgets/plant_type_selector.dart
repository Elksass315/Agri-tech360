import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class PlantTypeSelector extends StatelessWidget {
  final bool isTreatmentSelected;
  final Function(bool) onPlantTypeSelected;

  const PlantTypeSelector({
    Key? key,
    required this.isTreatmentSelected,
    required this.onPlantTypeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onPlantTypeSelected(false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 41.h,
              width: 180.w,
              decoration: BoxDecoration(
                color: isTreatmentSelected
                    ? Colors.transparent
                    : Colors.white.withOpacity(1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Center(
                child: Text(
                  'Information For Plants',
                  style: isTreatmentSelected
                      ? AppStyle.font11WhiteSemiBold
                      : AppStyle.font11PrimarySemiBold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => onPlantTypeSelected(true),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 41.h,
              width: 180.w,
              decoration: BoxDecoration(
                color: isTreatmentSelected
                    ? Colors.white.withOpacity(1)
                    : Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Center(
                child: Text(
                  'Traidment',
                  style: isTreatmentSelected
                      ? AppStyle.font11PrimarySemiBold
                      : AppStyle.font11WhiteSemiBold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
