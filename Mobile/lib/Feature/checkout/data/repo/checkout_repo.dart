import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment(
    PaymentIntentInputModel inputModel,
  );
}
