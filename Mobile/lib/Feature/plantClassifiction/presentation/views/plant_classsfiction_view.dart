import 'package:flutter/material.dart';

import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/plant_classfiction_view_body.dart';


class PlantCareView extends StatelessWidget {
  const PlantCareView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(243, 241, 240, 240),
      body: PlantCareViewBody(),
    );
  }
}

