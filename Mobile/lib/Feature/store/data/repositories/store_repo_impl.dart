import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/Feature/store/data/repositories/store_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';
import 'package:smartsoil/core/helper/local_services.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';

class StoreRepoImpl extends StoreRepo {

  StoreRepoImpl();
  @override
  Future<Either<Failure, List<StoreProductModel>>> getStoreData() async {
    try {
      String token = await LocalServices.getData(key: 'token');

    var response = await ApiServices.getData(
      endpoint: '$baseUrl$productsesendpoint',
      token: token,
    );

    List<StoreProductModel> products = [];

    if (response.containsKey('data')) {
      for (var product in response['data']) {
        products.add(StoreProductModel.fromJson(product));
      }
    }
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
      String token = await LocalServices.getData(key: 'token');

    List<MultipartFile> imageFiles = [];
    // Add primary image
    imageFiles.add(
      await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
    );
    // Add additional images
    for (var img in images) {
      imageFiles.add(
        await MultipartFile.fromFile(
          img.path,
          filename: img.path.split('/').last,
        ),
      );
    }

    FormData formData = FormData.fromMap({
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'image': imageFiles[0],
      'images': imageFiles.sublist(1),
    });

    await ApiServices.postFormData(
      endpoint: addproductsesendpoint,
      formData: formData,
      token: token,
    );
     
      return right(null);
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
}
