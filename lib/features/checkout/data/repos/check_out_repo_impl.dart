import 'package:checkout_payment_ui/core/errors/failures.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/repos/check_out_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utilis/stripe_service.dart';

class CheckOutRepoImpl implements CheckOutRepo {
  @override
  Future<Either<ServerFailures, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    StripeService stripeService = StripeService();

    try {
      await stripeService.makePayment(
          paymentintentinputmodel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailures(errMessage: e.toString()));
    }
  }
}
