import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/onbording/data/models/on_bording_model.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/networking/local_services.dart';
import 'package:smartsoil/core/routing/routes.dart';

import 'package:smartsoil/core/themaing/app_image_assets.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  @override
  void navigateToAuth({required BuildContext context}) {
    LocalServices.saveData(
      key: 'onbording',
      value: true,
    ).then((value) {
      if (value) {
        if (usertoken == null) {
          context.navigateAndRemoveUntil(
            newRoute: Routes.authViewRoute,
          );
        } else {
          context.navigateAndRemoveUntil(
            newRoute: Routes.layOutViewsRoute,
          );
        }
      }
    });
  }

  @override
  List<OnBordingModel> onBoardingPages() {
    return <OnBordingModel>[
      OnBordingModel(
        tittle: 'Keep your\nplant',
        imagepath: ImagesAssetsManger.onBordingimage1,
        subtittle: 'We will notify you daily for the care of your plant',
      ),
      OnBordingModel(
        tittle: 'Expert\nopinions',
        imagepath: ImagesAssetsManger.onBordingimage2,
        subtittle:
            'You will have a section of experts on the care of plants and how to preserve them',
      ),
      OnBordingModel(
        tittle: 'Be part of our\ncommunity',
        imagepath: ImagesAssetsManger.onBordingimage3,
        subtittle:
            'Meet other people with the same interest in conserving your plant and see what they achieved',
      ),
    ];
  }

  @override
  void navigateBetweenPages(
      {required BuildContext context,
      required PageController pageController,
      required bool isLastBoarding}) {
    if (isLastBoarding) {
      navigateToAuth(context: context);
    } else {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }
}
