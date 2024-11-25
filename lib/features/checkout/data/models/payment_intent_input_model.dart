class PaymentIntentInputModel {
  num amount;
  String currency;
  String customer;
  PaymentIntentInputModel(
      {required this.amount, required this.currency, required this.customer});

  toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'customer': customer,
    };
  }
}
