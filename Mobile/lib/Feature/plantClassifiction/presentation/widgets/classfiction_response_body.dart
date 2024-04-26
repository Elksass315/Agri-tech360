import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/models/classfiction_model.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/classfiction_product_list_view.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ClassfictionResponseBody extends StatelessWidget {
  const ClassfictionResponseBody({
    Key? key,
    required this.classfictionModel,
  }) : super(key: key);

  final ClassfictionModel classfictionModel;

  @override
  Widget build(BuildContext context) {
    final image = BlocProvider.of<PlantClassfictionCubite>(context).image;

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        width: double.infinity,
        height: 500.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: ColorManger.whiteColor,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: -50,
              child: CircleAvatar(
                radius: 62,
                backgroundColor: ColorManger.whiteColor,
                child: CircleAvatar(
                  // Make it in chased network image
                  backgroundImage: image != null
                      ? NetworkImage('$baseUrl${classfictionModel.image}')
                      : null,
                  backgroundColor: Colors.transparent,
                  radius: 44,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    classfictionModel.predictions,
                    style: AppStyle.font16blacksemibold,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'About this plant:',
                      style: AppStyle.font14blackmedium,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      classfictionModel.description,
                      style: AppStyle.font12Greymedium,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    height: 10.h,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Teratment:',
                      style: AppStyle.font14blackmedium,
                    ),
                  ),
                  classfictionModel.products.isNotEmpty
                      ? Expanded(
                          child: ClassfictionProductListView(
                            products: BlocProvider.of<PlantClassfictionCubite>(
                                    context)
                                .productsInfo,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 10, left: 2),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'No Product Realated to this plant',
                              style: AppStyle.font12Greymedium,
                            ),
                          ),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
