import 'dart:io';

import 'package:smartsoil/Feature/recommendNextCrop/data/models/next_crop_model.dart';

abstract class RecommendNextCropDataSources {
  Future<NextCropModel> getNextCropData(
      {required File image, required String previousCrop});
}
