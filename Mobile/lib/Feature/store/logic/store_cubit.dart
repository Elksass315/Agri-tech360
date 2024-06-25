import 'dart:developer';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/Feature/store/data/repositories/store_repo.dart';
part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit({required this.storeRepo}) : super(StoreInitial());

  static StoreCubit getObject(context) => BlocProvider.of<StoreCubit>(context);

  final StoreRepo storeRepo;

  List<StoreProductModel> productResult = <StoreProductModel>[];

  // Get the products
  Future<void> getProducts() async {
    emit(StoreGetProductsLoading());
    final productEither = await storeRepo.getStoreData();

    productEither.fold(
      (failure) {
        log(failure.errMessage.toString());
        emit(StoreGetProductsError(error: failure.errMessage.toString()));
      },
      (products) {
        productResult = products;
        emit(StoreGetProductsSuccess(products: products));
      },
    );
  }

  // Add Images to Add product
  List<File> imageList = [];
  Future<void> selectImages(ImagePicker picker) async {
    imageList = await storeRepo.pickedImagesFromGallary(picker);
    emit(StoreImageAdded());
  }

  // Remove Images from List of Images
  void removeImage(int index) {
    storeRepo.removeImageFromList(
      imageList: imageList,
      index: index,
    );
    emit(StoreImageRemoved());
  }

  // Add Product Method
  Future<void> addProduct(BuildContext context) async {
    emit(StoreAddProductLoading());

    final addProductEither = await storeRepo.addProductData(
      images: imageList,
      image: imageList[0],
      name: productNameController.text,
      tags: productTagsController.text,
      price: productPriceController.text,
      description: productDescriptionController.text,
    );
    addProductEither.fold(
      (failure) {
        log(failure.errMessage);
        emit(StoreAddProductError(error: failure.toString()));
      },
      (storeProductModel) async {
        emit(StoreAddProductSuccess());
        Navigator.pop(context);
        clearController();
        await getProducts();
        emit(StoreGetProductsSuccess(products: productResult));
      },
    );
  }

  void clearController() {
    productNameController.clear();
    productPriceController.clear();
    productDescriptionController.clear();
    productTagsController.clear();
    imageList.clear();
  }

  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productTagsController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
}
