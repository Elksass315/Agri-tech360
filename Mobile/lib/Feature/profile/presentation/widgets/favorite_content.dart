import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/favorites/logic/cubit/favorites_cubit.dart';
import 'package:smartsoil/Feature/favorites/presentaion/widgets/empty_favorite.dart';
import 'package:smartsoil/Feature/favorites/presentaion/widgets/favorite_card.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';

class FavoriteContent extends StatelessWidget {
  const FavoriteContent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is GetFavoritesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManger.primaryColor,
            ),
          );
        } else if (state is GetFavoritesSuccessState) {
          return state.favorites.isNotEmpty
              ? Scaffold(
                  appBar: AppBar(
                    title: const Text('Favorite'),
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.favorites.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 16.h,
                                right: 27.w,
                                left: 14.w,
                              ),
                              child: FavoriteCard(
                                favoriteModle: state.favorites[index],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              : FadeInDown(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 27.w,
                        left: 14.w,
                      ),
                      child: Image.asset(
                        ImagesAssetsManger.flowe_2Image,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
        } else if (state is GetFavoritesErrorState) {
          return FadeInDown(child: const EmptyView());
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManger.primaryColor,
            ),
          );
        }
      },
    );
  }
}
