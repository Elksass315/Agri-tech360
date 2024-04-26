import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartsoil/Feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:smartsoil/Feature/checkout/logic/cubit/check_out_cubit.dart';
import 'package:smartsoil/Feature/checkout/presenation/views/thank_you_view.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/card_Info_item.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/product_card.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/total_price_info.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/themaing/font_weight_helper.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';
import 'package:smartsoil/core/widgets/primary_header_continer.dart';

class MyCardViewBody extends StatefulWidget {
  const MyCardViewBody({super.key, required this.storeProductModel});
  final StoreProductModel storeProductModel;

  @override
  State<MyCardViewBody> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyCardViewBody> {
  bool payWithCash = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PrimaryHeaderContiner(
            height: 110.h,
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ColorManger.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(10),
                ProductCard(
                  storeProductModel: widget.storeProductModel,
                ),
                verticalSpacing(16),
                Text(
                  'Pay with',
                  style: AppStyle.font16Blackmedium.copyWith(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeightHelper.semibold,
                  ),
                ),
                verticalSpacing(8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      payWithCash = true;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: payWithCash
                          ? ColorManger.primaryColor
                          : ColorManger.whiteColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: ColorManger.primaryColor,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: ColorManger.primaryColor,
                          activeColor: ColorManger.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          value: payWithCash,
                          onChanged: (bool? value) {
                            setState(() {
                              payWithCash = value ?? true;
                            });
                          },
                        ),
                        Icon(
                          Iconsax.money_add,
                          size: 26,
                          color: payWithCash
                              ? ColorManger.whiteColor
                              : ColorManger.blackColor,
                        ),
                        horizontalSpacing(12),
                        Text(
                          'Cash',
                          style: AppStyle.font14Whitesemibold.copyWith(
                            fontFamily: 'Releway',
                            color: payWithCash
                                ? ColorManger.whiteColor
                                : ColorManger.blackColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                verticalSpacing(16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      payWithCash = false;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: payWithCash
                          ? Colors.transparent
                          : ColorManger.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: payWithCash
                            ? ColorManger.primaryColor
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: ColorManger.primaryColor,
                          activeColor: ColorManger.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          value: !payWithCash,
                          onChanged: (bool? value) {
                            setState(() {
                              payWithCash = !(value ?? false);
                            });
                          },
                        ),
                        Icon(
                          Icons.credit_card,
                          size: 33,
                          color: payWithCash
                              ? Colors.black
                              : ColorManger.whiteColor,
                        ),
                        horizontalSpacing(12),
                        Text(
                          'Credit Card',
                          style: AppStyle.font14Whitesemibold.copyWith(
                            fontFamily: 'Releway',
                            color: payWithCash
                                ? Colors.black
                                : ColorManger.whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                verticalSpacing(20),
                Text(
                  'Or Connect with the Saller',
                  style: AppStyle.font16Blackmedium.copyWith(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeightHelper.semibold,
                  ),
                ),
                verticalSpacing(10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<CheckOutCubit>(context).launchWhatsApp(
                            phoneNumber:
                                widget.storeProductModel.seller.phoneNumber,
                            context: context);
                      },
                      child: Image.asset(
                        ImagesAssetsManger.whatsappImage,
                        width: 40.w,
                        height: 40.h,
                      ),
                    ),
                    horizontalSpacing(10),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<CheckOutCubit>(context).launchphone(
                            phoneNumber:
                                widget.storeProductModel.seller.phoneNumber,
                            context: context);
                      },
                      child: Image.asset(
                        ImagesAssetsManger.telephoneCallImage,
                        width: 40.w,
                        height: 40.h,
                      ),
                    ),
                  ],
                ),
                verticalSpacing(20),
                CardInfoItem(
                  title: 'Order Subtotal',
                  value: '\$ ${widget.storeProductModel.price}',
                ),
                const SizedBox(height: 5),
                const CardInfoItem(title: 'Discount', value: '\$0'),
                const SizedBox(height: 5),
                const CardInfoItem(title: 'Shipping', value: '\$8.97'),
                const Divider(
                  thickness: 2,
                  color: Color(0xffC7C7C7),
                  height: 34,
                ),
                TotalPrice(
                  title: 'Total',
                  value: '\$ ${widget.storeProductModel.price} + \$8.97',
                ),
                const SizedBox(height: 50),
                BlocConsumer<CheckOutCubit, CheckOutState>(
                  listener: (context, state) {
                    if (state is CheckOutSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ThankYouView(
                              storeProductModel: widget.storeProductModel,
                            );
                          },
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomBottom(
                      isLoading: state is CheckOutLoading ? true : false,
                      backgroundColor: ColorManger.primaryColor,
                      bottomtext: 'pay',
                      onPressed: () {
                        if (payWithCash) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Cash Payment'),
                              content: const Text(
                                  'You have chosen to pay with cash.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          PaymentIntentInputModel paymentIntentInput =
                              PaymentIntentInputModel(
                            customerId: 'cus_Pdbvxp1eBo1KYs',
                            amount: widget.storeProductModel.price.toString(),
                            currency: 'USD',
                          );
                          BlocProvider.of<CheckOutCubit>(context)
                              .makepayment(paymentIntentInput);
                        }
                      },
                    );
                  },
                ),
                verticalSpacing(50),
              ],
            ),
          )
        ],
      ),
    );
  }
}
