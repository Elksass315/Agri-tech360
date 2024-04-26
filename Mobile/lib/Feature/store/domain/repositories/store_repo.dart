import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class StoreRepo {
  Future<Either<Failure, List<StoreProductModel>>> getStoreData();
  Future<List<File>> pickedImagesFromGallary(ImagePicker picker);
  void removeImageFromList({required int index, required List<File> imageList});

  Future<Either<Failure, void>> addProductData({
    required String name,
    required String price,
    required String description,
    required String tags,
    required List<File> images,
    required File image,
  });

  Future<Either<Failure, List<CommentModel>>> addComment({
    required String comment,
    required int productId,
  });
}
