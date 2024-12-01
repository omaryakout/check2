class InitPaymentSheetInputModel {
  String paymentIntentClientSecret;
  String customerId;
  String ephemeralKeySecret;
  InitPaymentSheetInputModel({
    required this.customerId,
    required this.ephemeralKeySecret,
    required this.paymentIntentClientSecret,
  });
}
