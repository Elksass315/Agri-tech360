// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:smartsoil/Feature/checkout/data/repo/checkout_repo.dart';
import 'package:smartsoil/core/error/servier_failure.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:url_launcher/url_launcher.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit({required this.checkOutRepo}) : super(CheckOutInitial());
  final CheckOutRepo checkOutRepo;
  Future makepayment(PaymentIntentInputModel paymentIntentInputModel) async {
    emit(CheckOutLoading());

    var response = await checkOutRepo.makePayment(paymentIntentInputModel);

    response.fold((falier) {
      emit(CheckOutError(falier.errMessage.toUpperCase()));
    }, (sucsses) {
      emit(CheckOutSuccess());
    });
  }

 void launchWhatsApp(
    {required String phoneNumber, required BuildContext context}) async {
  emit(LunchWhatsAppLoading());
  try {
    // Add Egypt's country code if not already present
    final String fullPhoneNumber = phoneNumber.startsWith('+20') ? phoneNumber : '+20$phoneNumber';

    // Create the URL for the WhatsApp link
    Uri url = Uri.parse(
      'https://wa.me/$fullPhoneNumber',
    );

    // Attempt to launch the URL
    bool launched = await launchUrl(url);

    if (launched) {
      // Emit success state if the URL was launched successfully
      emit(LunchWhatsAppSuccess());
    } else {
      // Handle case where the URL failed to launch
      context.pop();
    }
  } catch (e) {
    // Handle exceptions that may arise during URL launching
    if (e is DioException) {
      emit(LunchWhatsAppError(
        error: ServerFailure.fromDioException(e).errMessage,
      ));
    } else {
      emit(LunchWhatsAppError(error: ServerFailure(e.toString()).errMessage));
    }
  }
}


  void launchphone(
      {required String phoneNumber, required BuildContext context}) async {
    emit(LunchPhoneLoading());
    try {
      Uri url = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      bool launched = await launchUrl(url);

      if (launched) {
        emit(LunchPhoneSuccess());
      } else {
        context.pop();
      }
    } catch (e) {
      if (e is DioException) {
        emit(LunchWhatsAppError(
          error: ServerFailure.fromDioException(e).errMessage,
        ));
      } else {
        emit(
          LunchPhoneError(
            error: ServerFailure(e.toString()).errMessage,
          ),
        );
      }
    }
  }
}
