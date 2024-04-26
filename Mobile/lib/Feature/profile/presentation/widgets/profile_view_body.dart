import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/profile/logic/cubit/profile_cubit.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/Custom_list_tittle.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/change_password_form.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/general_profile_components.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/log_out_botton.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/profile_email_and_username.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/update_profile_form.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/custom_error_widget.dart';
import 'package:smartsoil/core/widgets/shows_toust_color.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ChangePasswordErrorState) {
          showTouster(
            massage: state.error,
            state: ToustState.ERROR,
          );
        }
        if (state is ChangePasswordSuccessState) {
          showTouster(
            massage: 'Password changed successfully',
            state: ToustState.SUCCESS,
          );
        }
      },
      builder: (context, state) {
        ProfileCubit cubit = BlocProvider.of<ProfileCubit>(context);
        if (state is ProfileLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManger.primaryColor,
            ),
          );
        } else if (state is ProfileSuccessState && cubit.userModel != null) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 190.h,
                      decoration: const BoxDecoration(
                        color: ColorManger.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: ProfileEmailAndUsername(cubit: cubit),
                        ),
                      ),
                    ),
                    FadeInLeft(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Update',
                                      style: AppStyle.font14Blacksemibold,
                                    ),
                                  ],
                                ),
                                CustomListTittle(
                                  title: const Text('Update profile'),
                                  leading: Image.asset(
                                    ImagesAssetsManger.profileImage,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cubit.isUserDataUpdateShow =
                                            !cubit.isUserDataUpdateShow;
                                      });
                                    },
                                    child: Icon(
                                      cubit.isUserDataUpdateShow
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_right,
                                    ),
                                  ),
                                ),
                                cubit.isUserDataUpdateShow
                                    ? const UpdateProfileForm()
                                    : Container(),
                                CustomListTittle(
                                  title: const Text('Update password'),
                                  leading: Image.asset(
                                    ImagesAssetsManger.changepasswordImage,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cubit.isUserpasswordShow =
                                            !cubit.isUserpasswordShow;
                                      });
                                    },
                                    child: Icon(
                                      cubit.isUserpasswordShow
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_right,
                                    ),
                                  ),
                                ),
                                cubit.isUserpasswordShow
                                    ? ChangePasswordForm(cubit: cubit)
                                    : Container(),
                              ],
                            ),
                            verticalSpacing(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'General',
                                  style: AppStyle.font14Blacksemibold,
                                ),
                              ],
                            ),
                            verticalSpacing(8),
                            const GeneralProfileComponents(),
                            verticalSpacing(24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'privacy',
                                  style: AppStyle.font14Blacksemibold,
                                ),
                              ],
                            ),
                            verticalSpacing(8),
                            Column(
                              children: [
                                CustomListTittle(
                                  title: const Text('Policies & Privacy'),
                                  leading: Image.asset(
                                    ImagesAssetsManger.privacyImage,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  trailing: const Icon(Icons.arrow_right),
                                ),
                              ],
                            ),
                            verticalSpacing(8),
                            const Divider(
                              color: ColorManger.greyColor,
                              height: 1,
                            ),
                            verticalSpacing(8),
                            const LogOutBotton()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        } else if (state is ProfileErrorState) {
          return CustomErrorWidget(
            onPressed: () {
              context.read<ProfileCubit>().getProfileData();
            },
            error: state.error,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: ColorManger.primaryColor),
          );
        }
      },
    );
  }
}
