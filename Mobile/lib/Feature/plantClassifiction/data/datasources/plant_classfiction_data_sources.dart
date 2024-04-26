import 'dart:io';

import 'package:smartsoil/Feature/plantClassifiction/data/models/classfiction_model.dart';

abstract class PlantClassficationDataSource {
  Future<ClassfictionModel> getClassficationData({required File image});
}
