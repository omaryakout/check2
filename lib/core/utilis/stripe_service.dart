import 'package:checkout_payment_ui/core/utilis/api_service.dart';
import 'package:checkout_payment_ui/core/utilis/keys.dart';
import 'package:dio/dio.dart';

import '../../features/checkout/data/models/payment_intent_input_model.dart';
import '../../features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentintentinputmodel) async {
    var result = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        body: paymentintentinputmodel.toJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: Keys.secretKey);

    var result2 = PaymentIntentModel.fromJson(result.data);
    return result2;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: 'omar'));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentintentinputmodel}) async {
    var response = await createPaymentIntent(paymentintentinputmodel);
    await initPaymentSheet(paymentIntentClientSecret: response.clientSecret!);
    await displayPaymentSheet();
  }
}
