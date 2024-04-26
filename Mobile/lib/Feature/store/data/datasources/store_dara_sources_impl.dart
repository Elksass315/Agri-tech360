import 'dart:io';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/store/data/datasources/store_data_sources.dart';
import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class StoreDataSourcesImpl extends StoreDataSources {
  @override
  Future<List<StoreProductModel>> getProducts() async {
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

    return products;
  }

  @override
  Future<void> addProduct({
    required String name,
    required String price,
    required String description,
    required String tags,
    required List<File> images,
    required File image,
  }) async {
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
  }

  @override
  Future<List<CommentModel>> addComment({
    required String comment,
    required int productId,
  }) async {
    String token = await LocalServices.getData(key: 'token');
    FormData formData = FormData.fromMap({
      'comment': comment,
      'product': productId,
    });

    var response = await ApiServices.postFormData(
      formData: formData,
      endpoint: '$baseUrl$addcommentendpoint', // Corrected endpoint
      token: token,
    );

    List<CommentModel> comments = [];

    if (response.containsKey('comment')) {
      // Check for 'comment' key instead of 'data'
      comments.add(CommentModel.fromJson(response['comment']));
      return comments;
    }
    return comments; // Return empty list if 'comment' key is not present in response
  }
}
