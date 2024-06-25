import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/models/next_crop_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class RecommendNextCropRepo {
  Future<File?> pickedImageFromGallary(ImagePicker picker);
  Future<File?> pickedImageFromCamira(ImagePicker picker);

  Future<Either<Failure, NextCropModel>> getNextCropData({
    required File image,
    required String previousCrop,
  });
}