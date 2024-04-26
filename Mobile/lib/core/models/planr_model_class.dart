import 'package:equatable/equatable.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';

class PlantModelClass extends Equatable {
  final PlantModle plantModle;

  const PlantModelClass({
    required this.plantModle,
  });

  @override
  List<Object?> get props => [
        plantModle,
      ];
}
