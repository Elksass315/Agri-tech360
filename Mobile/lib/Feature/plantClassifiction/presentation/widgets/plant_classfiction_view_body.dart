import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/classfiction_response_body.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/empty_uploaded_image.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/primary_header_continer.dart';
import 'package:smartsoil/core/widgets/shows_toust_color.dart';

class PlantCareViewBody extends StatefulWidget {
  const PlantCareViewBody({super.key});

  @override
  State<PlantCareViewBody> createState() => _PlantCareViewBodyState();
}

class _PlantCareViewBodyState extends State<PlantCareViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlantClassfictionCubite, PlantClasfictionState>(
      listener: (BuildContext context, PlantClasfictionState state) {
        if (state is UploadAndGetResponseToModelLoadingState) {
          showDialog(
            context: context,
            builder: (_) => const Center(
              child: CircularProgressIndicator(
                color: ColorManger.whiteColor,
              ),
            ),
          );
        } else if (state is UploadAndGetResponseToModelSucsesState) {
          if (state.plantCareModle.status == true) {
            Navigator.of(context)
                .pop(); // close the dialog if successfully logged in
            showTouster(
              massage: state.plantCareModle.message,
              state: ToustState.SUCCESS,
            );
          }
        }
        if (state is UploadAndGetResponseToModelErrorState) {
          Navigator.of(context).pop(); // close the dialog if login fails
          showTouster(
            massage: state.errorMessage,
            state: ToustState.ERROR,
          );
        }
      },
      builder: (context, state) {
        PlantClassfictionCubite cubit =
            PlantClassfictionCubite.getObject(context);

        return SingleChildScrollView(
          child: Column(
            children: [
              PrimaryHeaderContiner(
                height: MediaQuery.of(context).size.height * 0.19,
                child: SafeArea(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Good afternoon,shady',
                                  style: AppStyle.font18Whitesemibold,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  'Let’s take care of the plants together',
                                  style: AppStyle.font14Whiteregular,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      ImagesAssetsManger.appLogo,
                      height: 80.h,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Agri-tech360',
                      style: AppStyle.font20blacksemibold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      plantCareDescription,
                      style: AppStyle.font13Greymedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    cubit.classfictionModel != null
                        ? ClassfictionResponseBody(
                            classfictionModel: cubit.classfictionModel!,
                          )
                        : EmptyUploadedImage(
                            cubit: cubit,
                          ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
