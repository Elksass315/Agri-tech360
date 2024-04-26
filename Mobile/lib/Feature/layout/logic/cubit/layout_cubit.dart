import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/favorites/logic/cubit/favorites_cubit.dart';
import 'package:smartsoil/Feature/home/logic/cubit/home_cubit.dart';
import 'package:smartsoil/Feature/layout/domain/entity/change_index_params.dart';
import 'package:smartsoil/Feature/layout/domain/repositories/layout_repo.dart';
import 'package:smartsoil/Feature/profile/logic/cubit/profile_cubit.dart';
import 'package:smartsoil/Feature/store/logic/store_cubit.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit({required this.layOutRepo}) : super(LayoutInitial());

  final LayOutRepo layOutRepo;

  static LayoutCubit getObject(context) =>
      BlocProvider.of<LayoutCubit>(context);

  int currentIndex = 2;

  List<Widget> getBody() {
    return layOutRepo.getBody();
  }

  List<BottomNavigationBarItem> getBottomNavItems() =>
      layOutRepo.getBottomNavItems();

  void changeBottomNavIndex(int index, BuildContext context) {
    currentIndex = index;

    layOutRepo.changeBottomNavIndex(
      changeIndexParams: ChangeIndexParams(
        context: context,
        index: index,
      ),
    );

    if (currentIndex == 0) {
      BlocProvider.of<HomeCubit>(context).getWeather();
      BlocProvider.of<ExplorCubit>(context).getPlants();
    }

    if (currentIndex == 1) {
      BlocProvider.of<StoreCubit>(context).getProducts();
      BlocProvider.of<FavoritesCubit>(context).getFavorites();
    }
    if (currentIndex == 3) {
      BlocProvider.of<FavoritesCubit>(context).getFavorites();
      BlocProvider.of<StoreCubit>(context).getProducts();
    }
    if (currentIndex == 4) {
      BlocProvider.of<ProfileCubit>(context).getProfileData();
      BlocProvider.of<FavoritesCubit>(context).getFavorites();
    }
    emit(ChangeBottomNavState(index: index));
  }

  void changeBottomNavToHome(BuildContext context) {
    layOutRepo.changeBottomNavToHome(
        changeIndexParams: ChangeIndexParams(context: context));

    emit(const ChangeBottomNavToHome());
  }
}
