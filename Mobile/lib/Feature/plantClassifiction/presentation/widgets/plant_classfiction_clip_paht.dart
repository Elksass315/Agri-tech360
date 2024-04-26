import 'package:flutter/material.dart';

class ContainerHomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0003000, size.height * -0.0031571);
    path_0.lineTo(size.width * 0.0000400, size.height * 0.9824714);
    path_0.quadraticBezierTo(size.width * 0.0314600, size.height * 0.9270286,
        size.width * 0.0930200, size.height * 0.9134571);
    path_0.quadraticBezierTo(size.width * 0.1589000, size.height * 0.9014714,
        size.width * 0.3939000, size.height * 0.9046143);
    path_0.lineTo(size.width * 0.7051200, size.height * 0.9046143);
    path_0.quadraticBezierTo(size.width * 0.8276600, size.height * 0.9039286,
        size.width * 0.9049000, size.height * 0.9128857);
    path_0.quadraticBezierTo(size.width * 0.9654000, size.height * 0.9239571,
        size.width * 0.9992200, size.height * 0.9829857);
    path_0.lineTo(size.width * 0.9994000, size.height * -0.0000857);

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
