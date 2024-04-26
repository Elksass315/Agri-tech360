import 'dart:math';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/models/product_model.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ClassfictionProductItem extends StatelessWidget {
  const ClassfictionProductItem({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorManger.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 50,
            spreadRadius: 5,
            offset: const Offset(3, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          verticalSpacing(15),
          Flexible(
            child: SizedBox(
              height: 100.h,
              child: Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: SizedBox(
                        width: 130.w,
                        height: 200.h,
                        child: FancyShimmerImage(
                          imageUrl: '$baseUrl${productModel.images[0]}',
                          boxFit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.h, top: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: ColorManger.yellowColor,
                      size: 20,
                    ),
                    horizontalSpacing(2),
                    Text(
                      Random().nextDouble().toStringAsFixed(1),
                      style: AppStyle.font12Blackmedium,
                    ),
                    horizontalSpacing(4),
                    Text(
                      '(${Random().nextInt(100)} Reviews)',
                      style: AppStyle.font12Greyregular,
                    ),
                  ],
                ),
                verticalSpacing(3),
                Text(
                  'Seller : ${productModel.seller.fullName}',
                  style: AppStyle.font12Blackmedium,
                ),
                verticalSpacing(3),
                Text(
                  productModel.name,
                  style: AppStyle.font12Blackmedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${productModel.price}',
                      style: AppStyle.font14Blackregular,
                    ),
                    
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
