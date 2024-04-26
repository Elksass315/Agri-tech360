// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/favorites/logic/cubit/favorites_cubit.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    Key? key,
    required this.productModel,
    required this.selectedIndex,
  }) : super(key: key);
  final StoreProductModel productModel;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    var favoriteCubite = BlocProvider.of<FavoritesCubit>(context);
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Container(
          color: ColorManger.whiteColor,
          child: Stack(
            children: [
              SizedBox(
                height: 300.h,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20.h, right: 20.w, top: 20.h * 3.3),
                    child: CachedNetworkImage(
                      imageUrl: '$baseUrl${productModel.images[selectedIndex]}',
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: ColorManger.blackColor,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
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
                          favoriteCubite.favoritId.contains(productModel.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: BlocProvider.of<FavoritesCubit>(context)
                                  .favoritId
                                  .contains(productModel.id)
                              ? ColorManger.redColor
                              : ColorManger.redColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
