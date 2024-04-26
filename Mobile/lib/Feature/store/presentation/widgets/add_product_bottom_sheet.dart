import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/store/logic/store_cubit.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/add_product_bottom_sheet_form.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';
import 'package:smartsoil/core/widgets/shows_toust_color.dart';

class AddProductBottomSheet extends StatefulWidget {
  const AddProductBottomSheet({super.key});

  @override
  State<AddProductBottomSheet> createState() => _AddProductBottomSheetState();
}

class _AddProductBottomSheetState extends State<AddProductBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final storeCubit = context.read<StoreCubit>();
    return BlocConsumer<StoreCubit, StoreState>(
      listener: (BuildContext context, StoreState state) {
        if (state is StoreAddProductLoading) {
          showDialog(
            context: context,
            builder: (_) => const Center(
              child: CircularProgressIndicator(
                color: ColorManger.primaryColor,
              ),
            ),
          );
        }
        if (state is StoreGetProductsSuccess) {
          context.pop();
        }
        if (state is StoreAddProductError) {
          showTouster(
            massage: state.error,
            state: ToustState.ERROR,
          );
        }
      },
      builder: (context, state) {
        return Container(
          height: 700.h,
          decoration: const BoxDecoration(
            color: ColorManger.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 16.h,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                children: [
                  AddProductBottomSheetForm(
                    storeCubit: storeCubit,
                  ),
                  verticalSpacing(30),
                  CustomBottom(
                    onPressed: () async {
                      if (storeCubit.formKey.currentState!.validate() == true) {
                        await storeCubit.addProduct(context);
                      } else {
                        storeCubit.autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    bottomtext: 'Add Product',
                    backgroundColor: ColorManger.primaryColor,
                    bottomWidth: 350.w,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
