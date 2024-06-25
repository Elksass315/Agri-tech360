import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/store/logic/store_cubit.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/traidment_card.dart';

class StoreListOfProduct extends StatelessWidget {
  const StoreListOfProduct({
    super.key,
    required this.cubit,
  });

  final StoreCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 700),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
        child: GridView.count(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 1 / 1.5,
          mainAxisSpacing: 20,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            cubit.productResult.length,
            (index) {
              return TraidmentProductCard(
                productModel: cubit.productResult[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
