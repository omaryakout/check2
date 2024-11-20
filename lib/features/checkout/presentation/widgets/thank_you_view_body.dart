import 'package:checkout_payment_ui/features/checkout/presentation/widgets/custom_check_icon.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';

import 'custom_dashed_line.dart';

// class ThankYouViewBody extends StatelessWidget {
//   const ThankYouViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Container(
//             decoration: ShapeDecoration(
//                 color: Color(0xFFEDEDED),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20))),
//           ),
//           Positioned(
//               bottom: MediaQuery.sizeOf(context).height * .2,
//               left: -15,
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//               )),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: MediaQuery.sizeOf(context).height * .2 +10,
//               child:Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   children:
//                     List.generate(30, (index) {
//                       return Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 2),
//                           child: Container(
//                             color: const Color.fromARGB(255, 18, 17, 17),
//                             height:2,
//                           ),
//                         ),
//                       );
//                     },)

//                 ),
//               )),
//           Positioned(
//               bottom: MediaQuery.sizeOf(context).height * .2,
//               right: -15,
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//               )),
//           Positioned(
//               left: 0,
//               right: 0,
//               top: -40,
//               child: CircleAvatar(
//                 radius: 40,
//                 backgroundColor: Color(0xFFEDEDED),
//                 child: CircleAvatar(
//                   radius: 30,
//                   backgroundColor: Color(0xFF53A834),
//                   child: Icon(
//                     Icons.check,
//                     size: 30,
//                     color: Colors.white,
//                   ),
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }
class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: const CustomDashedLine(),
          ),
          Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
