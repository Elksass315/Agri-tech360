import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/my_card_view_body.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({super.key, required this.storeProductModel});
  final StoreProductModel storeProductModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: MyCardViewBody(
        storeProductModel: storeProductModel,
      ),
    );
  }
}
