import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:smartsoil/Feature/checkout/data/repo/checkout_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';
import 'package:smartsoil/core/helper/stripe_services.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  final StripeServices stripeServices = StripeServices();
  @override
  Future<Either<Failure, void>> makePayment(
      PaymentIntentInputModel inputModel) async {
    try {
      await stripeServices.makePayment(paymentIntentInputModel: inputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
