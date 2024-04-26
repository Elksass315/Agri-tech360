import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package for date and time formatting
import 'package:smartsoil/Feature/checkout/presenation/widgets/master_card_Info_widget.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/thank_you_item.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/total_price_info.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    Key? key,
    required this.storeProductModel,
  }) : super(key: key);

  final StoreProductModel storeProductModel;
  @override
  Widget build(BuildContext context) {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Format the date and time using intl package
    String formattedDate = DateFormat('MM/dd/yyyy').format(now);
    String formattedTime = DateFormat('hh:mm a').format(now);

    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        color: Colors.grey.withOpacity(0.18),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50 + 16,
          left: 22,
          right: 22,
          bottom: 16,
        ),
        child: Column(
          children: [
            const Text(
              'Thank you',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            // Display the current date
            ThankYouItem(
              title: 'Date',
              value: formattedDate,
            ),
            const SizedBox(
              height: 20,
            ),
            // Display the current time
            ThankYouItem(
              title: 'Time',
              value: formattedTime,
            ),
            const SizedBox(
              height: 20,
            ),
            ThankYouItem(
              title: 'To',
              value: storeProductModel.seller.fullName.toString(),
            ),
            const Divider(
              height: 50,
              thickness: 2,
            ),
            TotalPrice(
              title: 'Total',
              value: '${storeProductModel.price.toString()}\$',
            ),
            const SizedBox(
              height: 20,
            ),
            const MasterCardInfoWidget(),
            const Spacer(
              flex: 3,
            ),
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/barcode.png',
                    width: 160,
                    height: 90,
                  ),
                ),
                CustomBottom(
                  bottomHeight: 46,
                  bottomWidth: 100,
                  onPressed: () {
                    context.navigateTo(routeName: Routes.layOutViewsRoute);
                  },
                  bottomtext: 'Home',
                  textBottomStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
