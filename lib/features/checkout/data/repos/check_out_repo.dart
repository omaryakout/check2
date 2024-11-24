import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
abstract class CheckOutRepo {
  Future<Either<ServerFailures, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}
