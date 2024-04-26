import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/Feature/details/widgets/information_sliver_app_bar.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class CareInstractionViewBody extends StatelessWidget {
  const CareInstractionViewBody({
    super.key,
    required this.plant,
  });

  final PlantModle plant;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 16.w),
          sliver: InformationSliverAppBar(
            plant: plant,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: FadeInUp(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(6),
                  Text(
                    'Care Instructions',
                    style: AppStyle.font22BlackBold,
                  ),
                  verticalSpacing(6),
                  Text(
                    plant.careInstructions,
                    style: AppStyle.font14lightblackmdeium,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
