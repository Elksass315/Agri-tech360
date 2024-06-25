import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smartsoil/app.dart';
import 'package:smartsoil/bloc_observer.dart.dart';
import 'package:smartsoil/core/helper/fuctions_helper.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/helper/local_services.dart';
import 'package:smartsoil/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.stripePublishableKey;
  Bloc.observer = MyBlocObserver();
  ApiServices.init();
  await LocalServices.init();
  ServiceLocator().setUpServiceLocator();
  fetchDataFromLocalStorage();
  runApp(const MyApp());
}
