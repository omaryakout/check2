import 'package:checkout_payment_ui/core/widgets/custom_button.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/web_view_paypal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilis/keys.dart';
import '../../../../core/utilis/paypal_service.dart';
import '../../data/models/payment_intent_input_model.dart';
import '../thank_you_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSucess) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ThankYouView(),
          ));
        }
        if (state is PaymentFailure) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        PaymentIntentInputModel paymentIntentInputModel =
            PaymentIntentInputModel(
                amount: 100, currency: 'USD', customer: 'cus_RIL1hMo6HrjXdV');
        return CustomButton(
          text: 'continue',
          isLoading: state is PaymentLoading ? true : false,
          onTap: () async {
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);
            var paypal = PaypalService();
            paypal.executePayment(Keys.clientIdPaypal, Keys.clientSecretPaypal);
           
          },
        );
      },
    );
  }
}
