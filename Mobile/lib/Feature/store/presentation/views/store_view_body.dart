import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartsoil/Feature/store/logic/store_cubit.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/add_product_bottom_sheet.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/hellow_row.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/store_list_of_product.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/primary_header_continer.dart';

class StoreViewBody extends StatelessWidget {
  const StoreViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContiner(
              height: MediaQuery.of(context).size.height / 5.5,
              child: Column(
                children: [
                  const HellowRow(),
                  verticalSpacing(25),
                ],
              ),
            ),
            BlocBuilder<StoreCubit, StoreState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<StoreCubit>(context);
                if (state is StoreGetProductsSuccess) {
                  return StoreListOfProduct(cubit: cubit);
                } else if (state is StoreGetProductsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.greyColor,
                    ),
                  );
                } else if (state is StoreGetProductsError) {
                  return Center(
                    child: Column(
                      children: [
                        verticalSpacing(200),
                        const Icon(
                          Iconsax.card_add,
                          size: 75,
                        ),
                        verticalSpacing(5),
                        Text(
                          'No Product Here Please Add Your Product',
                          style: AppStyle.font14Blacksemibold.copyWith(
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.greyColor,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManger.primaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34),
                topRight: Radius.circular(34),
              ),
            ),
            context: context,
            builder: (context) {
              return const AddProductBottomSheet();
            },
          );
        },
        child: const Icon(Iconsax.add),
      ),
    );
  }
}
