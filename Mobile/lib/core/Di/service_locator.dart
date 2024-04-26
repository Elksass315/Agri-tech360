import 'package:get_it/get_it.dart';
import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo.dart';
import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo_impl.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo_impl.dart';
import 'package:smartsoil/Feature/auth/logic/login_cubite/login_cubit.dart';
import 'package:smartsoil/Feature/auth/logic/sign_up_cubite/sign_up_cubit.dart';
import 'package:smartsoil/Feature/checkout/data/repo/checkout_repo.dart';
import 'package:smartsoil/Feature/checkout/data/repo/checkout_repo_impl.dart';
import 'package:smartsoil/Feature/checkout/logic/cubit/check_out_cubit.dart';
import 'package:smartsoil/Feature/comments/data/datasources/comment_data_sources.dart';
import 'package:smartsoil/Feature/comments/data/datasources/comment_data_sources_impl.dart';
import 'package:smartsoil/Feature/comments/data/repositories/comment_repo_impl.dart';
import 'package:smartsoil/Feature/comments/domain/repositories/comment_repo.dart';
import 'package:smartsoil/Feature/comments/logic/comment_cubite/comment_cubit.dart';
import 'package:smartsoil/Feature/explor/data/datasources/explor_data_sources.dart';
import 'package:smartsoil/Feature/explor/data/datasources/explor_data_sources_impl.dart';
import 'package:smartsoil/Feature/explor/data/repositories/explor_repo_impl.dart';
import 'package:smartsoil/Feature/explor/domain/repositories/explor_repo.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/favorites/data/datasources/favorite_data_soureces.dart';
import 'package:smartsoil/Feature/favorites/data/datasources/favorite_data_soureces_impl.dart';
import 'package:smartsoil/Feature/favorites/data/repositories/favorite_repo_impl.dart';
import 'package:smartsoil/Feature/favorites/domain/repositories/favorites_repo.dart';
import 'package:smartsoil/Feature/favorites/logic/cubit/favorites_cubit.dart';
import 'package:smartsoil/Feature/home/data/datasources/home_data_sources.dart';
import 'package:smartsoil/Feature/home/data/datasources/home_data_sources_impl.dart';
import 'package:smartsoil/Feature/home/domain/repositories/home_repo.dart';
import 'package:smartsoil/Feature/home/data/repositories/home_repo_impl.dart';
import 'package:smartsoil/Feature/home/logic/cubit/home_cubit.dart';
import 'package:smartsoil/Feature/layout/data/datasources/layout_datasource.dart';
import 'package:smartsoil/Feature/layout/data/datasources/layout_datasource_impl.dart';
import 'package:smartsoil/Feature/layout/data/repositories/layout_repo_impl.dart';
import 'package:smartsoil/Feature/layout/domain/repositories/layout_repo.dart';
import 'package:smartsoil/Feature/layout/logic/cubit/layout_cubit.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo_impl.dart';
import 'package:smartsoil/Feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/datasources/plant_classfiction_data_sources.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/datasources/plant_classfiction_data_sources_impl.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/repositories/plant_classfiction_repo_impl.dart';
import 'package:smartsoil/Feature/plantClassifiction/domain/repositories/plant_classfictaion_repo.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/Feature/profile/data/datasources/profile_data_sources.dart';
import 'package:smartsoil/Feature/profile/data/datasources/profile_data_sources_impl.dart';
import 'package:smartsoil/Feature/profile/data/repositories/profile_repo_impl.dart';
import 'package:smartsoil/Feature/profile/domain/repositories/profile_repo.dart';
import 'package:smartsoil/Feature/profile/logic/cubit/profile_cubit.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/datasources/recommend_next_crop_data_sources.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/datasources/recommend_next_crop_data_sources_impl.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/repositories/recommend_next_crop_repo_impl.dart';
import 'package:smartsoil/Feature/recommendNextCrop/domain/repositories/recommend_next_crop_repo.dart';
import 'package:smartsoil/Feature/recommendNextCrop/logic/recommend_next_crop_cubit.dart';
import 'package:smartsoil/Feature/store/data/datasources/store_dara_sources_impl.dart';
import 'package:smartsoil/Feature/store/data/datasources/store_data_sources.dart';
import 'package:smartsoil/Feature/store/data/repositories/store_repo_impl.dart';
import 'package:smartsoil/Feature/store/domain/repositories/store_repo.dart';
import 'package:smartsoil/Feature/store/logic/store_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future<void> setupServiceLocator() async {
    _setupForDataSources();

    _setupForRepos();

    _setupForCubits();
  }

  void _setupForRepos() {
    serviceLocator
        .registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl());
    serviceLocator
        .registerLazySingleton<CheckOutRepo>(() => CheckOutRepoImpl());
    serviceLocator.registerLazySingleton<LoginRepo>(() => LoginRepoImpl());
    serviceLocator.registerLazySingleton<SignUpRepo>(() => SignUpRepoImpl());

    serviceLocator.registerLazySingleton<HomeRepo>(() =>
        HomeRepooImpl(homeDataSource: serviceLocator.get<HomeDataSource>()));

    serviceLocator.registerLazySingleton<ExplorRepo>(() => ExplorRepoImpl(
        explorDataSources: serviceLocator.get<ExplorDataSources>()));

    serviceLocator.registerLazySingleton<LayOutRepo>(() => LayoutRepoImpl(
        layoutDataSource: serviceLocator.get<LayoutDataSource>()));

    serviceLocator.registerLazySingleton<PlantCareRepo>(() => PlantCareRepoImpl(
        plantClassficationDataSource:
            serviceLocator.get<PlantClassficationDataSource>()));

    serviceLocator.registerLazySingleton<StoreRepo>(() => StoreRepoImpl(
        storeDataSources: serviceLocator.get<StoreDataSources>()));

    serviceLocator.registerLazySingleton<FavoritesRepo>(() => FavoritesRepoImpl(
        favoriteDataSource: serviceLocator.get<FavoriteDataSource>()));

    serviceLocator.registerLazySingleton<CommentRepo>(() => CommentRepoImpl(
        commentDataSources: serviceLocator.get<CommentDataSources>()));

    serviceLocator.registerLazySingleton<RecommendNextCropRepo>(() =>
        RecommendNextCropRepoImpl(
            recommendNextCropDataSources:
                serviceLocator.get<RecommendNextCropDataSources>()));

    serviceLocator.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(
        profileDataSources: serviceLocator.get<ProfileDataSources>()));
  }

  void _setupForDataSources() {
    serviceLocator.registerLazySingleton<LayoutDataSource>(
      () => LayoutDataSourceImpl(),
    );

    serviceLocator.registerLazySingleton<ExplorDataSources>(
      () => ExplorDataSourcesImpl(),
    );

    serviceLocator.registerLazySingleton<HomeDataSource>(
      () => HomeDatSourceImpl(),
    );
    serviceLocator.registerLazySingleton<PlantClassficationDataSource>(
      () => PlantClassfictionDataSourceImpl(),
    );

    serviceLocator.registerLazySingleton<StoreDataSources>(
      () => StoreDataSourcesImpl(),
    );

    serviceLocator.registerLazySingleton<FavoriteDataSource>(
      () => FavoritesDataSoureceImpl(),
    );

    serviceLocator.registerLazySingleton<CommentDataSources>(
      () => CommentDataSourcesImpl(),
    );

    serviceLocator.registerLazySingleton<RecommendNextCropDataSources>(
      () => RecommendNextCropDataSourcesImpl(),
    );
    serviceLocator.registerLazySingleton<ProfileDataSources>(
      () => ProfileDataSourcesImpl(),
    );
  }

  void _setupForCubits() {
    serviceLocator.registerFactory<OnbordingCubit>(
      () =>
          OnbordingCubit(onBoardingRepo: serviceLocator.get<OnBoardingRepo>()),
    );
    serviceLocator.registerFactory<LoginCubit>(
        () => LoginCubit(loginRepo: serviceLocator.get<LoginRepo>()));
    serviceLocator.registerFactory<SignUpCubit>(
        () => SignUpCubit(signUpRepo: serviceLocator.get<SignUpRepo>()));
    serviceLocator.registerFactory<LayoutCubit>(
        () => LayoutCubit(layOutRepo: serviceLocator.get<LayOutRepo>()));
    serviceLocator.registerFactory<HomeCubit>(
        () => HomeCubit(homeRepo: serviceLocator.get<HomeRepo>()));
    serviceLocator.registerFactory<ExplorCubit>(
        () => ExplorCubit(explorRepo: serviceLocator.get<ExplorRepo>()));

    serviceLocator.registerFactory<PlantClassfictionCubite>(() =>
        PlantClassfictionCubite(
            plantCareRepo: serviceLocator.get<PlantCareRepo>()));

    serviceLocator.registerFactory<StoreCubit>(
        () => StoreCubit(storeRepo: serviceLocator.get<StoreRepo>()));

    serviceLocator.registerFactory<FavoritesCubit>(() =>
        FavoritesCubit(favoritesRepo: serviceLocator.get<FavoritesRepo>()));

    serviceLocator.registerFactory<CommentCubit>(
        () => CommentCubit(commentRepo: serviceLocator.get<CommentRepo>()));

    serviceLocator.registerFactory<RecommendNextCropCubit>(() =>
        RecommendNextCropCubit(
            recommendNextCropRepo:
                serviceLocator.get<RecommendNextCropRepo>()));

    serviceLocator.registerFactory<ProfileCubit>(
        () => ProfileCubit(profileRepo: serviceLocator.get<ProfileRepo>()));

    serviceLocator.registerFactory<CheckOutCubit>(
        () => CheckOutCubit(checkOutRepo: serviceLocator.get<CheckOutRepo>()));
  }
}
