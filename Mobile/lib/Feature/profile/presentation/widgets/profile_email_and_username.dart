import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/profile/logic/cubit/profile_cubit.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ProfileEmailAndUsername extends StatelessWidget {
  const ProfileEmailAndUsername({
    super.key,
    required this.cubit,
  });

  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account',
          style: AppStyle.font21Whitebold,
        ),
        verticalSpacing(16),
        Visibility(
          visible: true,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(
                  '$baseUrl${cubit.userModel!.data!.profilePic}',
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      cubit.userModel!.data!.fullName!,
                      style: AppStyle.font16Whitebold,
                    ),
                    verticalSpacing(2),
                    Text(
                      cubit.userModel!.data!.email!,
                      style: AppStyle.font12Whitesemibold,
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}