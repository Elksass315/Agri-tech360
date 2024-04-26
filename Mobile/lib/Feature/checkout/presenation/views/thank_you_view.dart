import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/thank_you_view_body.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key, required this.storeProductModel});
  final StoreProductModel storeProductModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 28,
          ),
        ),
      ),
      body: Transform.translate(
        offset: const Offset(0, -5), // offset of the body TO MOVE IT INTO TOP
        child: ThankYouViewBody(
          storeProductModel: storeProductModel,
        ),
      ),
    );
  }
}
