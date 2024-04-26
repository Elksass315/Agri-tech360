import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/details/widgets/product_image_slider.dart';
import 'package:smartsoil/Feature/details/widgets/rating_and_description.dart';
import 'package:smartsoil/Feature/details/widgets/review_all_comment.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final StoreProductModel productModel;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int _selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(
              productModel: widget.productModel,
              selectedIndex: _selectedImageIndex,
            ),
            RatingAndDescription(
              productModel: widget.productModel,
              onImageSelected: (index) {
                setState(() {
                  _selectedImageIndex = index;
                });
              },
            ),
            verticalSpacing(30),
            ReviewAllComment(
              productModel: widget.productModel,
            ),
            verticalSpacing(15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: AppStyle.font16blacksemibold.copyWith(
                          fontFamily: 'Raleway',
                        ),
                      ),
                      verticalSpacing(5),
                      Text(
                        '\$${widget.productModel.price.toInt().toString()}',
                        style: AppStyle.font24blakBold,
                      )
                    ],
                  ),
                  CustomBottom(
                    bottomHeight: 50,
                    bottomWidth: 180,
                    onPressed: () {
                      context.navigateTo(
                        routeName: Routes.myCardViewRoute,
                        arguments: widget.productModel,
                      );
                    },
                    bottomtext: 'Buy Now',
                    backgroundColor: ColorManger.primaryColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
