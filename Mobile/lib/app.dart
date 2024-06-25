import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/comments/logic/comment_cubite/comment_cubit.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/favorites/logic/cubit/favorites_cubit.dart';
import 'package:smartsoil/Feature/home/logic/cubit/home_cubit.dart';
import 'package:smartsoil/Feature/layout/logic/cubit/layout_cubit.dart';
import 'package:smartsoil/Feature/profile/logic/cubit/profile_cubit.dart';
import 'package:smartsoil/Feature/store/logic/store_cubit.dart';
import 'package:smartsoil/core/routing/app_routes.dart';
import 'package:smartsoil/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => serviceLocator.get<LayoutCubit>(),
          ),
          BlocProvider(
            create: (context) => serviceLocator.get<HomeCubit>()..getWeather(),
          ),
          BlocProvider(
            create: (context) => serviceLocator.get<ExplorCubit>()..getPlants(),
          ),
          BlocProvider(
            create: (context) =>
                serviceLocator.get<StoreCubit>()..getProducts(),
          ),
          BlocProvider(
            create: (context) => serviceLocator.get<FavoritesCubit>(),
          ),
          BlocProvider(
            create: (context) => serviceLocator.get<CommentCubit>(),
          ),
          BlocProvider(
            create: (context) => serviceLocator.get<ProfileCubit>(),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}
