import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.onTap,
    required this.storeProductModel,
  }) : super(key: key);

  final StoreProductModel storeProductModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 125.h,
        decoration: BoxDecoration(
          color: ColorManger.scaffoldColor,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 10.w,
                  left: 8.w,
                  top: 5.h,
                  bottom: 5.w,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(19.r)),
                  child: SizedBox(
                    width: 100.w,
                    height: 75.h,
                    child: CachedNetworkImage(
                      imageUrl: '$baseUrl${storeProductModel.image}',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10.w, top: 10.h, bottom: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              storeProductModel.name,
                              style: AppStyle.font16blacksemibold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpacing(5),
                    Expanded(
                      child: Text(
                        storeProductModel.description,
                        style: AppStyle.font13Greymedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      ' \$ ${storeProductModel.price}', // or use a proper formatting for price
                      style: AppStyle.font17Blacksemibold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
