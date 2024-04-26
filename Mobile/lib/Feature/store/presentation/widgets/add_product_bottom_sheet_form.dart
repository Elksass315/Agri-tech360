import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/store/logic/store_cubit.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/helper/validators_helper.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_text_formfield.dart';

class AddProductBottomSheetForm extends StatefulWidget {
  const AddProductBottomSheetForm({Key? key, required this.storeCubit})
      : super(key: key);
  final StoreCubit storeCubit;

  @override
  State<AddProductBottomSheetForm> createState() =>
      _AddProductBottomSheetFormState();
}

class _AddProductBottomSheetFormState extends State<AddProductBottomSheetForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.storeCubit.formKey,
      autovalidateMode: widget.storeCubit.autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 4.h,
              width: 55.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: ColorManger.lightGreyColor.withOpacity(0.6)),
            ),
            verticalSpacing(10),
            Text(
              'Add Your product',
              style: AppStyle.font17Blacksemibold.copyWith(
                fontFamily: 'Raleway',
              ),
            ),
            verticalSpacing(5),
            CustomTextFormFiled(
              controller: widget.storeCubit.productNameController,
              hintText: 'Product Name',
              keyboardType: TextInputType.name,
              obscureText: false,
              validator: MyValidatorsHelper.displayProductNamevalidator,
            ),
            verticalSpacing(5),
            CustomTextFormFiled(
              controller: widget.storeCubit.productPriceController,
              hintText: 'Product Price',
              obscureText: false,
              keyboardType: TextInputType.number,
              validator: MyValidatorsHelper.displayProductPricevalidator,
            ),
            verticalSpacing(5),
            CustomTextFormFiled(
              controller: widget.storeCubit.productDescriptionController,
              hintText: 'Description',
              obscureText: false,
              maxLine: 3,
              validator: MyValidatorsHelper.displayProductDescribtionevalidator,
            ),
            verticalSpacing(5),
            CustomTextFormFiled(
              controller: widget.storeCubit.productTagsController,
              hintText: 'Tags',
              obscureText: false,
              validator: MyValidatorsHelper.displayProductTagsvalidator,
            ),
            verticalSpacing(15),
            Padding(
              padding: EdgeInsets.only(right: 8.w, top: 16.h, left: 8.w),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 80.h,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        itemCount: widget.storeCubit.imageList.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topLeft,
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      widget.storeCubit.removeImage(index),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      File(widget
                                          .storeCubit.imageList[index].path),
                                      width: 80.w,
                                      height: 80.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -5,
                                  left: -5,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        widget.storeCubit.removeImage(index);
                                      });
                                    },
                                    child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorManger.greyColor
                                              .withOpacity(0.7),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.close,
                                            size: 18,
                                            color: ColorManger.redColor,
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.storeCubit.selectImages(ImagePicker());
                      });
                    },
                    icon: const Icon(Icons.camera_alt_outlined),
                    color: ColorManger.primaryColor,
                  ),
                ],
              ),
            ),
            verticalSpacing(10),
          ],
        ),
      ),
    );
  }
}
