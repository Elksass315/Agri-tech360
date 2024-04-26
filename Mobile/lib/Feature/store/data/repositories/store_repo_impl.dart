import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/store/data/datasources/store_data_sources.dart';
import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/Feature/store/domain/repositories/store_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class StoreRepoImpl extends StoreRepo {
  final StoreDataSources storeDataSources;

  StoreRepoImpl({required this.storeDataSources});
  @override
  Future<Either<Failure, List<StoreProductModel>>> getStoreData() async {
    try {
      List<StoreProductModel> products = await storeDataSources.getProducts();
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> addProductData({
    required String name,
    required String price,
    required String description,
    required String tags,
    required List<File> images,
    required File image,
  }) async {
    try {
      final storeProductModel = await storeDataSources.addProduct(
        name: name,
        price: price,
        description: description,
        tags: tags,
        images: images,
        image: image,
      );
      return right(storeProductModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  void removeImageFromList(
      {required int index, required List<File> imageList}) {
    if (imageList.isNotEmpty) {
      imageList.removeAt(index);
    }
  }

  @override
  Future<List<File>> pickedImagesFromGallary(ImagePicker picker) async {
    List<File> imageList = [];

    final List<XFile> selectedImages = await picker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      for (var xFile in selectedImages) {
        File file = File(xFile.path);
        if (await file.exists()) {
          imageList.add(file);
        }
      }
    }
    return imageList;
  }

  @override
  Future<Either<Failure, List<CommentModel>>> addComment(
      {required String comment, required int productId}) async {
    try {
      final commentModel = await storeDataSources.addComment(
        comment: comment,
        productId: productId,
      );
      return right(commentModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
