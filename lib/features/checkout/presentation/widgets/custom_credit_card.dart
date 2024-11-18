import 'package:checkout_payment_ui/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key});
//  {super.key, required this.formKey, required this.autovalidateMode}

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  bool showBackView = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          child: CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackView,
            isHolderNameVisible: true,
            onCreditCardWidgetChange: (value) {},
          ),
        ),
        CreditCardForm(
            isHolderNameVisible: true,
            autovalidateMode: autovalidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (carditCardModel) {
              cardHolderName = carditCardModel.cardHolderName;
              expiryDate = carditCardModel.expiryDate;
              cvvCode = carditCardModel.cvvCode;
              cardNumber = carditCardModel.cardNumber;
              showBackView = carditCardModel.isCvvFocused;
              setState(() {});
            },
            formKey: formKey),
      ],
    );
  }
}
