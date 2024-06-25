import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDevloperBottomSheet extends StatelessWidget {
  const ContactDevloperBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorManger.lightMoreGreyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManger.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    Text(
                      'Eng : Shady Mohamed',
                      style: AppStyle.font14Blackmedium,
                    ),
                    verticalSpacing(3),
                    Text(
                      'Mobile App developer',
                      style: AppStyle.font13Greymedium,
                    ),
                    verticalSpacing(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            luchUrl(
                                theUrl:
                                    'https://www.linkedin.com/in/shady-steha-182311230/');
                          },
                          child: Image.asset(
                            height: 30.h,
                            ImagesAssetsManger.linkdedInIcon,
                          ),
                        ),
                        horizontalSpacing(10),
                        GestureDetector(
                          onTap: () {
                            luchUrl(
                                theUrl:
                                    'https://www.facebook.com/shady.steha.7/');
                          },
                          child: Image.asset(
                            height: 30.h,
                            ImagesAssetsManger.facebookIcon,
                          ),
                        ),
                        horizontalSpacing(10),
                        GestureDetector(
                          onTap: () => luchUrl(
                              theUrl: 'https://github.com/shadymohamed532001'),
                          child: Image.asset(
                            ImagesAssetsManger.githupIcon,
                            height: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManger.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    Text(
                      'Eng : Sherif Shaaban',
                      style: AppStyle.font14Blackmedium,
                    ),
                    verticalSpacing(3),
                    Text(
                      'Backend developer',
                      style: AppStyle.font13Greymedium,
                    ),
                    verticalSpacing(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            luchUrl(
                                theUrl:
                                    'https://www.linkedin.com/in/sherif-shaaban-377217224/');
                          },
                          child: Image.asset(
                            height: 30.h,
                            ImagesAssetsManger.linkdedInIcon,
                          ),
                        ),
                        horizontalSpacing(10),
                        GestureDetector(
                          onTap: () {
                            luchUrl(
                                theUrl:
                                    'https://www.facebook.com/sherif.shaaban.31105');
                          },
                          child: Image.asset(
                            height: 30.h,
                            ImagesAssetsManger.facebookIcon,
                          ),
                        ),
                        horizontalSpacing(10),
                        GestureDetector(
                          onTap: () {
                            luchUrl(theUrl: 'https://github.com/Sheryoo');
                          },
                          child: Image.asset(
                            height: 30.h,
                            ImagesAssetsManger.githupIcon,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

luchUrl({required String theUrl}) async {
  Uri url = Uri.parse(theUrl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
