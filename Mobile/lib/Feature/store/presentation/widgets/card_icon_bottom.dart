import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartsoil/Feature/store/logic/store_cubit.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class CardIconBottom extends StatelessWidget {
  const CardIconBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        if (state is StoreGetProductsSuccess) {
          return InkWell(
            onTap: () {},
            child: Badge(
              label: Text(
                BlocProvider.of<StoreCubit>(context)
                    .productResult
                    .length
                    .toString(),
              ),
              child: const Icon(
                Iconsax.shopping_bag,
                color: ColorManger.whiteColor,
              ),
            ),
          );
        } else {
          return InkWell(
            onTap: () {},
            child: Badge(
              label: Text(
                BlocProvider.of<StoreCubit>(context)
                    .productResult
                    .length
                    .toString(),
              ),
              child: const Icon(
                Iconsax.shopping_bag,
                color: ColorManger.whiteColor,
              ),
            ),
          );
        }
      },
    );
  }
}
