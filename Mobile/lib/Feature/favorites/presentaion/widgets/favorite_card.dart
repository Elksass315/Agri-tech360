import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/Feature/favorites/presentaion/widgets/remove_from_fav_bottom_sheet.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    Key? key,
    required this.favoriteModle,
    this.onTap,
  }) : super(key: key);

  final FavoriteData favoriteModle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110.h,
        decoration: BoxDecoration(
          color: ColorManger.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 10.w,
                  left: 5.w,
                  top: 5.h,
                  bottom: 5.w,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(19.r)),
                  child: SizedBox(
                    width: 120.w,
                    height: 75.h,
                    child: CachedNetworkImage(
                      imageUrl: '$baseUrl${favoriteModle.image}',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5, top: 10, bottom: 10),
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
                              favoriteModle.name,
                              style: AppStyle.font14Blacksemibold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                RemoveFromFavBottomSheet.show(
                                  context: context,
                                  favoriteModle: favoriteModle,
                                );
                              },
                              child: Icon(
                                Icons.favorite,
                                color: ColorManger.redColor,
                                size: 18.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        favoriteModle.description,
                        style: AppStyle.font13Greymedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Seller : ${favoriteModle.seller.fullName}',
                            style: AppStyle.font13Blacksemibold,
                          ),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          '${favoriteModle.price.toInt().toString()} \$ ',
                          style: AppStyle.font14Blacksemibold,
                        ),
                      ],
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
