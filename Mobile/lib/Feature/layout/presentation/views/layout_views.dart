import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/layout/presentation/widgets/bottom_nav_bar.dart';
import 'package:smartsoil/Feature/layout/presentation/widgets/layout_view_body.dart';

class LayOutViews extends StatefulWidget {
  const LayOutViews({super.key});

  @override
  State<LayOutViews> createState() => _LayOutViewsState();
}

class _LayOutViewsState extends State<LayOutViews> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LayOutViewBody(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
