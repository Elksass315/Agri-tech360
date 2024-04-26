import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/custom_check_icon.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/custom_dashed_line.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/thank_you_card.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key, required this.storeProductModel});
  final StoreProductModel storeProductModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        bottom: 100,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(
            storeProductModel: storeProductModel,
          ),
          Positioned(
            right: 20 + 8,
            left: 20 + 8,
            top: MediaQuery.of(context).size.height * .55 +
                20, // 20 is the radius of the circle avatar
            child: const CustomDashedLine(),
          ),
          Positioned(
            left: -20,
            top: MediaQuery.of(context).size.height * .55,
            child: const CircleAvatar(
              backgroundColor: ColorManger.scaffoldColor,
            ),
          ),
          Positioned(
            right: -20,
            top: MediaQuery.of(context).size.height * .55,
            child: const CircleAvatar(
              backgroundColor: ColorManger.scaffoldColor,
            ),
          ),
          const Positioned(
            top: -50,
            right: 0,
            left: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
