import 'package:checkout_payment_ui/features/checkout/presentation/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/utilis/styles.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:Center(child: SvgPicture.asset('assets/images/arrow.svg')) ,
        title: Text('My Cart',style: Styles.style25,),
      ),
      body: MyCartViewBody(),
    );
  }
}


