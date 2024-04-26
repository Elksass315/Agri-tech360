import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 40,
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 60,
        ),
      ),
    );
  }
}
