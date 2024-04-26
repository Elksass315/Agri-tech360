import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/agritech_ai_chat.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/heal_your_crop_and_plant_text.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/recntly_viewed_list_view.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/recommed_next_crop_text.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/weather_degree_list_view.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/line_back_ground.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Stack(
              children: [
                const LineBackGround(),
                SafeArea(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Agri-tech360',
                          style: AppStyle.font21PrimaryBold,
                        ),
                        verticalSpacing(20),
                        const HealYourCropAndPlantText(),
                        verticalSpacing(20),
                        const RecommedNextCropText(),
                        verticalSpacing(25),
                        const WeatherDegreeListView(),
                        verticalSpacing(20),
                        const AgriteachAiChat(),
                        verticalSpacing(20),
                        const RecntlyViewedListView()
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
