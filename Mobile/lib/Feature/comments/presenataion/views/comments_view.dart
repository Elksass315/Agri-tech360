import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/comments/presenataion/widgets/comments_view_body.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key, required this.productModel});
  final StoreProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommentsViewBody(
        productModel: productModel,
      ),
    );
  }
}
