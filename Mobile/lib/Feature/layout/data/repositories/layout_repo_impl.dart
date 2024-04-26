import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/layout/data/datasources/layout_datasource.dart';
import 'package:smartsoil/Feature/layout/domain/entity/change_index_params.dart';
import 'package:smartsoil/Feature/layout/domain/repositories/layout_repo.dart';

class LayoutRepoImpl extends LayOutRepo {
  final LayoutDataSource layoutDataSource;

  LayoutRepoImpl({required this.layoutDataSource});
  @override
  void changeBottomNavIndex({required ChangeIndexParams changeIndexParams}) {
    layoutDataSource.changeBottomNavIndex(changeIndexParams: changeIndexParams);
  }

  @override
  void changeBottomNavToHome({required ChangeIndexParams changeIndexParams}) {
    layoutDataSource.changeBottomNavToHome(
        changeIndexParams: changeIndexParams);
  }

  @override
  List<Widget> getBody() {
    return layoutDataSource.getBody();
  }

  @override
  List<BottomNavigationBarItem> getBottomNavItems() =>
      layoutDataSource.getBottomNavItems();
}
