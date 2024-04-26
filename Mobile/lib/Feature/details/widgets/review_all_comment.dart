import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/comments/presenataion/views/comments_view.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ReviewAllComment extends StatelessWidget {
  const ReviewAllComment({
    super.key,
    required this.productModel,
  });
  final StoreProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const Divider(
              thickness: 0.5, height: 5, color: ColorManger.greyColor),
          Padding(
            padding: EdgeInsets.only(
              top: 8.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Comments',
                  style: AppStyle.font16Blackmedium,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CommentsView(productModel: productModel);
                      }));
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
