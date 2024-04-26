import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartsoil/Feature/explor/presentation/views/explor_view_body.dart';
import 'package:smartsoil/Feature/favorites/presentaion/views/favorite_viiew_body.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/home_body.dart';
import 'package:smartsoil/Feature/layout/data/datasources/layout_datasource.dart';
import 'package:smartsoil/Feature/layout/domain/entity/change_index_params.dart';
import 'package:smartsoil/Feature/layout/logic/cubit/layout_cubit.dart';
import 'package:smartsoil/Feature/profile/presentation/profile_view.dart';
import 'package:smartsoil/Feature/store/presentation/views/store_view_body.dart';

class LayoutDataSourceImpl extends LayoutDataSource {
  @override
  void changeBottomNavIndex({required ChangeIndexParams changeIndexParams}) {
    LayoutCubit.getObject(changeIndexParams.context).currentIndex =
        changeIndexParams.index!;
  }

  @override
  void changeBottomNavToHome({required ChangeIndexParams changeIndexParams}) {
    LayoutCubit.getObject(changeIndexParams.context).currentIndex = 2;
  }

  @override
  List<Widget> getBody() {
    return const <Widget>[
      ExplorViewBody(),
      StoreViewBody(),
      HomeBody(),
      FavoriteViewBody(),
      ProfileView(),
    ];
  }

  @override
  List<BottomNavigationBarItem> getBottomNavItems() =>
      const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explor',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.shop),
          label: 'store',
        ),
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Iconsax.home),
        ),
        BottomNavigationBarItem(
          label: 'Favorite',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.user),
          label: 'Profile',
        ),
      ];
}
