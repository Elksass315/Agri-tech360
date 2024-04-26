// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class RatingAndDescription extends StatefulWidget {
  const RatingAndDescription({
    Key? key,
    required this.productModel,
    required this.onImageSelected,
  }) : super(key: key);
  final StoreProductModel productModel;
  final Function(int) onImageSelected;

  @override
  _RatingAndDescriptionState createState() => _RatingAndDescriptionState();
}

class _RatingAndDescriptionState extends State<RatingAndDescription> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.productModel.name,
            style: AppStyle.font20blacksemibold.copyWith(
              fontFamily: 'Raleway',
            ),
          ),
          verticalSpacing(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Iconsax.star5,
                    color: ColorManger.yellowColor,
                    size: 20,
                  ),
                  horizontalSpacing(2),
                  Text(
                    Random().nextDouble().toStringAsFixed(1),
                    style: AppStyle.font14Blackmedium,
                  ),
                  horizontalSpacing(4),
                  Text(
                    '(${Random().nextInt(100)} Reviews)',
                    style: AppStyle.font12Greyregular,
                  ),
                ],
              ),
            ],
          ),
          verticalSpacing(16),
          Text(
            'Product details',
            style: AppStyle.font16blacksemibold.copyWith(
              fontFamily: 'Raleway',
            ),
          ),
          verticalSpacing(8),
          Text(
            widget.productModel.description,
            style: AppStyle.font14Greyregular.copyWith(
              fontFamily: 'Raleway',
            ),
          ),
          verticalSpacing(25),
          SizedBox(
            height: 80,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.productModel.images.length - 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    widget.onImageSelected(index);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: ColorManger.whiteColor,
                      borderRadius: BorderRadius.circular(
                        24,
                      ),
                      border: Border.all(
                        color: _selectedIndex == index
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              '$baseUrl${widget.productModel.images[index]}',
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
