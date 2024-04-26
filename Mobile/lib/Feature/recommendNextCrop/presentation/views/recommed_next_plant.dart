import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/recommendNextCrop/presentation/widgets/recommed_next_crop_body.dart';

class RecommedNextCrop extends StatelessWidget {
  const RecommedNextCrop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(243, 241, 240, 240),
      body: RecommedNextCropBody(),
    );
  }
}
