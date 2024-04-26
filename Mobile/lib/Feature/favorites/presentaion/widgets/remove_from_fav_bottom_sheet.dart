import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/Feature/favorites/logic/cubit/favorites_cubit.dart';
import 'package:smartsoil/Feature/favorites/presentaion/widgets/favorite_card.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class RemoveFromFavBottomSheet {
  static void show(
      {required BuildContext context, required FavoriteData favoriteModle}) {
    showModalBottomSheet<Widget>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => FavBottomSheet(favoriteModle: favoriteModle),
    );
  }
}

class FavBottomSheet extends StatefulWidget {
  const FavBottomSheet({
    super.key,
    required this.favoriteModle,
  });

  final FavoriteData favoriteModle;

  @override
  State<FavBottomSheet> createState() => _FavBottomSheetState();
}

class _FavBottomSheetState extends State<FavBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _initController();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          child: BottomSheet(
            showDragHandle: true,
            enableDrag: true,
            animationController: _animationController,
            onDragStart: (_) {
              _animationController.forward();
            },
            onClosing: () => context.pop(),
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                right: 15.w,
                left: 15.w,
                bottom: 30.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Remove from favorite?',
                    style: AppStyle.font17Blacksemibold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  FavoriteCard(
                    favoriteModle: widget.favoriteModle,
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomBottom(
                          backgroundColor:
                              ColorManger.primaryColor.withOpacity(0.24),
                              borderColor:  ColorManger.primaryColor.withOpacity(0.24) ,
                              
                          onPressed: () => context.pop(),
                          bottomtext: 'Cancel',
                          textBottomStyle: AppStyle.font14Primarysemibold,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: CustomBottom(
                          onPressed: () {
                            BlocProvider.of<FavoritesCubit>(context)
                                .removeFavorites(
                              productId: widget.favoriteModle.id,
                            );
                            context.pop();
                          },
                          backgroundColor: ColorManger.primaryColor,
                          bottomtext: 'Yes, remove',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
