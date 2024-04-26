import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/details/view/information_about_plant.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class MoreInformationTextBottom extends StatelessWidget {
  const MoreInformationTextBottom({
    super.key,
    required this.plant,
  });
  final PlantModle plant;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InformationAboutPlant(
              plant: plant,
            ),
          ),
        );
      },
      child: Text(
        'More Information',
        style: AppStyle.font16LightGreymedium.copyWith(
          color: ColorManger.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
