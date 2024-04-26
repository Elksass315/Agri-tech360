import 'dart:io';

import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';

abstract class StoreDataSources {
  Future<List<StoreProductModel>> getProducts();

  Future<void> addProduct({
    required String name,
    required String price,
    required String description,
    required String tags,
    required List<File> images,
    required File image,
  });

  Future<List<CommentModel>> addComment({
    required String comment,
    required int productId,
  }); // need to add time of the comment  ;
}
