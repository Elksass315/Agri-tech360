import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/classfiction_response_body.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/empty_uploaded_image.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
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
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorManger.primaryColor.withOpacity(0.80),
                    ColorManger.primaryColor,
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                context.pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        ColorManger.whiteColor.withOpacity(0.7),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                      )
                                    ]),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    right: 2.0,
                                    top: 1,
                                    bottom: 1,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 23,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: const Color(0xffD9D9D9).withOpacity(0.2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome to Agri-tech 360',
                                    style: AppStyle.font18Whitesemibold,
                                  ),
                                  Text(
                                    'Let’s take care of the plants together',
                                    style: AppStyle.font14Whiteregular,
                                  ),
                                  verticalSpacing(8),
                                  Text(
                                    plantCareDescription,
                                    style: AppStyle.font14Whiteregular.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            cubit.classfictionModel != null
                                ? SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 16,
                                  )
                                : SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 9,
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
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
