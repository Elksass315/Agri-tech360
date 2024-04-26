import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/plant_classfiction_clip_paht.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class PrimaryHeaderContiner extends StatelessWidget {
  const PrimaryHeaderContiner(
      {super.key, required this.child, this.height = 300});
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: ClipPath(
        clipper: ContainerHomeClipper(),
        child: Container(
          margin: EdgeInsets.zero,
          color: ColorManger.primaryColor,
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            child: Stack(
              children: [
                Positioned(
                  right: -200,
                  top: -300,
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      color: Colors.white.withOpacity(0.08),
                    ),
                  ),
                ),
                Positioned(
                  right: -290,
                  top: 50,
                  child: Container(
                      height: 400,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(400),
                        color: Colors.white.withOpacity(0.09),
                      )),
                ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
