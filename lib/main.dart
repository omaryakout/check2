import 'package:checkout_payment_ui/core/utilis/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'features/checkout/presentation/my_cart.dart';

void main() {
  Stripe.publishableKey = Keys.publishKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCart(),
    );
  }
}
