import 'package:checkout_payment_ui/core/widgets/custom_button.dart';
import 'package:checkout_payment_ui/features/checkout/data/repos/check_out_repo.dart';
import 'package:checkout_payment_ui/features/checkout/data/repos/check_out_repo_impl.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/payment_details.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/widgets/custom_button_bloc_consumer.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/widgets/payment_methods_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/cubit/payment_cubit.dart';
import 'cart_info_item.dart';
import 'total_price_widget.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'42.97$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'0$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'8$',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(title: 'Total', value: r'$50.97'),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomButton(
            text: 'complete payment',
            isLoading: false,
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => PaymentDetailsView(),
              // ));
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) =>
                        PaymentCubit(checkOutRepo: CheckOutRepoImpl()),
                    
                    child: PaymentMethodsBottomSheet(),
                  );
                },
              );
            },
          ),
          SizedBox(
            height: 19,
          ),
        ],
      ),
    );
  }
}
