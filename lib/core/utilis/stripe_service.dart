import 'package:checkout_payment_ui/core/utilis/api_service.dart';
import 'package:checkout_payment_ui/core/utilis/keys.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:dio/dio.dart';
import '../../features/checkout/data/models/ephemeralkeymodel/ephemeralkeymodel.dart';
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
       headers:{
         'Authorization': "Bearer ${Keys.secretKey}"
        }, );

    var result2 = PaymentIntentModel.fromJson(result.data);
    return result2;
  }

  Future initPaymentSheet({required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
           customerId: initPaymentSheetInputModel.customerId,
           paymentIntentClientSecret: initPaymentSheetInputModel.paymentIntentClientSecret,
           customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKeySecret,
            merchantDisplayName: 'omar'));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<Ephemeralkeymodel> getEphemeralKey({required String customerId}) async {
    var response = await apiService.post(
        body: {'customer': customerId},
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        contentType: Headers.formUrlEncodedContentType,
        headers: {
         'Authorization': "Bearer ${Keys.secretKey}",
         'Stripe-Version':'2024-10-28.acacia'
        },
        );

    return Ephemeralkeymodel.fromJson(response.data);
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentintentinputmodel}) async {
    var response = await createPaymentIntent(paymentintentinputmodel);
   var response2 = await getEphemeralKey(customerId:response.customer );
    await initPaymentSheet(initPaymentSheetInputModel: InitPaymentSheetInputModel(customerId: response.customer, ephemeralKeySecret: response2.secret!, paymentIntentClientSecret: response.clientSecret!));
    
    await displayPaymentSheet();
    
   
  }
}
