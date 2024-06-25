import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo.dart';
import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo_impl.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo_impl.dart';
import 'package:smartsoil/Feature/checkout/data/repo/checkout_repo.dart';
import 'package:smartsoil/Feature/checkout/data/repo/checkout_repo_impl.dart';
import 'package:smartsoil/Feature/comments/data/repositories/comment_repo_impl.dart';
import 'package:smartsoil/Feature/comments/data/repositories/comment_repo.dart';
import 'package:smartsoil/Feature/explor/data/repositories/explor_repo_impl.dart';
import 'package:smartsoil/Feature/explor/data/repositories/explor_repo.dart';
import 'package:smartsoil/Feature/favorites/data/repositories/favorite_repo_impl.dart';
import 'package:smartsoil/Feature/favorites/data/repositories/favorites_repo.dart';
import 'package:smartsoil/Feature/home/data/repositories/home_repo_impl.dart';
import 'package:smartsoil/Feature/home/data/repositories/home_repo.dart';
import 'package:smartsoil/Feature/layout/data/repositories/layout_repo_impl.dart';
import 'package:smartsoil/Feature/layout/data/repositories/layout_repo.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo_impl.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/repositories/plant_classfiction_repo_impl.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/repositories/plant_classfictaion_repo.dart';
import 'package:smartsoil/Feature/profile/data/repositories/profile_repo_impl.dart';
import 'package:smartsoil/Feature/profile/data/repositories/profile_repo.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/repositories/recommend_next_crop_repo_impl.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/repositories/recommend_next_crop_repo.dart';
import 'package:smartsoil/Feature/store/data/repositories/store_repo_impl.dart';
import 'package:smartsoil/Feature/store/data/repositories/store_repo.dart';
import 'package:smartsoil/service_locator.dart';

class SetupForRepos {
  void setupForRepos() {
    serviceLocator
        .registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl());
    serviceLocator
        .registerLazySingleton<CheckOutRepo>(() => CheckOutRepoImpl());
    serviceLocator.registerLazySingleton<LoginRepo>(() => LoginRepoImpl());
    serviceLocator.registerLazySingleton<SignUpRepo>(() => SignUpRepoImpl());

    serviceLocator.registerLazySingleton<HomeRepo>(() =>
        HomeRepooImpl());

    serviceLocator.registerLazySingleton<ExplorRepo>(() => ExplorRepoImpl());

    serviceLocator.registerLazySingleton<LayOutRepo>(() => LayoutRepoImpl(
     ));

    serviceLocator.registerLazySingleton<PlantCareRepo>(() => PlantCareRepoImpl(
    ));

    serviceLocator.registerLazySingleton<StoreRepo>(() => StoreRepoImpl(
       ));

    serviceLocator.registerLazySingleton<FavoritesRepo>(() => FavoritesRepoImpl(
    ));

    serviceLocator.registerLazySingleton<CommentRepo>(() => CommentRepoImpl(
  ));

    serviceLocator.registerLazySingleton<RecommendNextCropRepo>(() =>
        RecommendNextCropRepoImpl(
       ));

    serviceLocator.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(
        ));
  }
}
