import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/details/widgets/plant_details_view_body.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';

class PlantDetailsView extends StatelessWidget {
  const PlantDetailsView({
    super.key,
    required this.plant,
  });

  final PlantModle plant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlantDetailsViewBody(
        plant: plant,
      ),
    );
  }
}
