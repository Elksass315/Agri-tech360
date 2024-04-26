import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/models/classfiction_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class PlantCareRepo {
  Future<File?> pickedImageFromGallary(ImagePicker picker);
  Future<File?> pickedImageFromCamira(ImagePicker picker);

  Future<Either<Failure, ClassfictionModel>> getClassficationData({
    required File image,
  });
}
