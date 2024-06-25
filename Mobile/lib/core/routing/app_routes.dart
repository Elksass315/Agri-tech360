import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/ai_chat/logic/cubit/ai_chat_cubit.dart';
import 'package:smartsoil/Feature/ai_chat/presentaion/views/ai_chat_view.dart';
import 'package:smartsoil/Feature/auth/logic/login_cubite/login_cubit.dart';
import 'package:smartsoil/Feature/auth/logic/sign_up_cubite/sign_up_cubit.dart';
import 'package:smartsoil/Feature/auth/presentation/widgets/views/auth_view_body.dart';
import 'package:smartsoil/Feature/checkout/logic/cubit/check_out_cubit.dart';
import 'package:smartsoil/Feature/checkout/presenation/views/my_card_view.dart';
import 'package:smartsoil/Feature/details/view/product_details_view.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/views/plant_classsfiction_view.dart';
import 'package:smartsoil/Feature/details/view/plant_details_view.dart';
import 'package:smartsoil/Feature/home/presentation/views/recentaly_see_all_view.dart';
import 'package:smartsoil/Feature/layout/logic/cubit/layout_cubit.dart';
import 'package:smartsoil/Feature/layout/presentation/views/layout_views.dart';
import 'package:smartsoil/Feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:smartsoil/Feature/onbording/presentation/on_boarding_view.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/favorite_content.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/policies_privets_view.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/recntly_viewed_content.dart';
import 'package:smartsoil/Feature/recommendNextCrop/logic/recommend_next_crop_cubit.dart';
import 'package:smartsoil/Feature/recommendNextCrop/presenation/views/recommed_next_plant.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/models/planr_model_class.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/service_locator.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        if (onBording != null) {
          if (usertoken != null) {
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => serviceLocator.get<LayoutCubit>(),
                child: const LayOutViews(),
              ),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => serviceLocator.get<LoginCubit>(),
                  ),
                  BlocProvider(
                    create: (context) => serviceLocator.get<SignUpCubit>(),
                  ),
                ],
                child: const AuthViewBody(),
              ),
            );
          }
        } else {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => serviceLocator.get<OnbordingCubit>(),
              child: const OnBordingView(),
            ),
          );
        }

      case Routes.authViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => serviceLocator.get<LoginCubit>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator.get<SignUpCubit>(),
              ),
            ],
            child: const AuthViewBody(),
          ),
        );

      case Routes.layOutViewsRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const LayOutViews();
          },
        );
      case Routes.favoriteContentViewRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const FavoriteContent();
          },
        );
     
      case Routes.recentlyViewedContent:
        return MaterialPageRoute(
          builder: (context) => const RecntlyViewedContent(),
        );

      case Routes.recentlySeeAllViewViewRoute:
        return MaterialPageRoute(
          builder: (context) => const RecentlySeeAllView(),
        );

      case Routes.plantDetailsViewRoute:
        final args = routeSettings.arguments as PlantModelClass;
        return MaterialPageRoute(
          builder: (context) => PlantDetailsView(
            plant: args.plantModle,
          ),
        );

      case Routes.traidmentProductDetailsViewRoute:
        return MaterialPageRoute(
          builder: (context) => ProductDetailsView(
            productModel: routeSettings.arguments as StoreProductModel,
          ),
        );
      case Routes.myCardViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<CheckOutCubit>(),
            child: MyCardView(
              storeProductModel: routeSettings.arguments as StoreProductModel,
            ),
          ),
        );
      case Routes.recommedNextCropsViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<RecommendNextCropCubit>(),
            child: const RecommedNextCrop(),
          ),
        );

      case Routes.plantCareViewRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => serviceLocator.get<PlantClassfictionCubite>(),
            child: const PlantCareView(),
          );
        });
      case Routes.chatViewRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => AiChatCubit(),
            child: const ChatView(),
          );
        });
      case Routes.policiesAndPrivacyRoute:
        return MaterialPageRoute(builder: (context) {
          return const PoliciesAndPrivacy();
        });
      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            'Not Found this Route',
            style: AppStyle.font14Blacksemibold,
          ),
        ),
      ),
    );
  }
}
