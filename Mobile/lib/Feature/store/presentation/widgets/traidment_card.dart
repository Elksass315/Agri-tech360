import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/favorites/logic/cubit/favorites_cubit.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class TraidmentProductCard extends StatelessWidget {
  const TraidmentProductCard({
    super.key,
    required this.productModel,
  });

  final StoreProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(
          routeName: Routes.traidmentProductDetailsViewRoute,
          arguments: productModel,
        );
      },
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          var favoriteCubite = BlocProvider.of<FavoritesCubit>(context);

          return Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
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
                    height: 120.h,
                    child: Stack(
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: SizedBox(
                              width: 130.w,
                              height: 200.h,
                              child: FancyShimmerImage(
                                imageUrl: '$baseUrl${productModel.image}',
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
                      verticalSpacing(3),
                      Text(
                        'Seller : ${productModel.seller.fullName}',
                        style: AppStyle.font12Blackmedium,
                      ),
                      Text(
                        productModel.name,
                        style: AppStyle.font12Blackmedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ ${productModel.price} ',
                            style: AppStyle.font14Blacksemibold,
                          ),
                          Container(
                            width: 38.w,
                            height: 45.h,
                            decoration: const BoxDecoration(
                              color: ColorManger.whiteColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                if (favoriteCubite.favoritId
                                    .contains(productModel.id)) {
                                  favoriteCubite.removeFavorites(
                                      productId: productModel.id);
                                } else {
                                  favoriteCubite.addFavorites(
                                      productId: productModel.id);
                                }
                              },
                              icon: Icon(
                                favoriteCubite.favoritId
                                        .contains(productModel.id)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 22,
                                color: favoriteCubite.favoritId
                                        .contains(productModel.id)
                                    ? ColorManger.redColor
                                    : ColorManger.redColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
