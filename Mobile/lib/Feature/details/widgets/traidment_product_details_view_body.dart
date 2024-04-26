import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/details/widgets/product_details_app_bar.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class TradmentProductDetailsViewBody extends StatelessWidget {
  const TradmentProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const ProductDetailsAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(10),
                Text(
                  'Care Instructions',
                  style: AppStyle.font22BlackBold,
                ),
                verticalSpacing(10),
                Text(
                  ' plant.careInstruction',
                  style: AppStyle.font14lightblackmdeium,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
