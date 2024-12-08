// library flutter_paypal_checkout;

// import 'package:checkout_payment_ui/core/utilis/paypal_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// import '../../../core/utilis/keys.dart';

// class PaypalCheckoutView extends StatefulWidget {
//   // final Function onSuccess, onCancel, onError;
//   // final String? note, clientId, secretKey;

//   // final Widget? loadingIndicator;
//   // final List? transactions;
//   // final bool? sandboxMode;
//   const PaypalCheckoutView({
//     Key? key,
//     // required this.onSuccess,
//     // required this.onError,
//     // required this.onCancel,
//     // required this.transactions,
//     // required this.clientId,
//     // required this.secretKey,
//     // this.sandboxMode = false,
//     // this.note = '',
//     // this.loadingIndicator,
//   }) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return PaypalCheckoutViewState();
//   }
// }

// class PaypalCheckoutViewState extends State<PaypalCheckoutView> {
//   String? checkoutUrl;
//   String navUrl = '';
//   String executeUrl = '';
//   String accessToken = '';
//   bool loading = true;
//   bool pageloading = true;
//   bool loadingError = false;
//   late PaypalService services;
//   int pressed = 0;
//   double progress = 0;
//   final String returnURL =
//       'https://www.youtube.com/channel/UC9a1yj1xV2zeyiFPZ1gGYGw';
//   final String cancelURL = 'https://www.facebook.com/tharwat.samy.9';

//   late InAppWebViewController webView;

//   Map getOrderParams() {
//     Map<String, dynamic> temp = {
//       // "intent": "sale",
//       // "payer": {"payment_method": "paypal"},
//       // "transactions": widget.transactions,
//       // "note_to_payer": widget.note,
//       // "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
//     };
//     return temp;
//   }

//   @override
//   void initState() {
//     services = PaypalService();

//     super.initState();
//     Future.delayed(Duration.zero, () async {
//       services.executePayment(Keys.clientIdPaypal, Keys.clientSecretPaypal);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (checkoutUrl != null) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: const Text(
//             "Paypal Payment",
//           ),
//         ),
//         body: Stack(
//           children: <Widget>[
//             InAppWebView(
//               shouldOverrideUrlLoading: (controller, navigationAction) async {
//                 final url = navigationAction.request.url;

//                 if (url.toString().contains(returnURL)) {
                  
//                   return NavigationActionPolicy.CANCEL;
//                 }
//                 if (url.toString().contains(cancelURL)) {
//                   return NavigationActionPolicy.CANCEL;
//                 } else {
//                   return NavigationActionPolicy.ALLOW;
//                 }
//               },
//               initialUrlRequest: URLRequest(url: WebUri(checkoutUrl!)),
//               // initialOptions: InAppWebViewGroupOptions(
//               //   crossPlatform: InAppWebViewOptions(
//               //     useShouldOverrideUrlLoading: true,
//               //   ),
//               // ),
//               onWebViewCreated: (InAppWebViewController controller) {
//                 webView = controller;
//               },
//               onCloseWindow: (InAppWebViewController controller) {
//                 widget.onCancel();
//               },
//               onProgressChanged:
//                   (InAppWebViewController controller, int progress) {
//                 setState(() {
//                   this.progress = progress / 100;
//                 });
//               },
//             ),
//             progress < 1
//                 ? SizedBox(
//                     height: 3,
//                     child: LinearProgressIndicator(
//                       value: progress,
//                     ),
//                   )
//                 : const SizedBox(),
//           ],
//         ),
//       );
//     } else {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: const Text(
//             "Paypal Payment",
//           ),
//         ),
//         body: Center(
//             child:
//                 widget.loadingIndicator ?? const CircularProgressIndicator()),
//       );
//     }
//   }

//   // void exceutePayment(Uri? url, BuildContext context) {
//   //   final payerID = url!.queryParameters['PayerID'];
//   //   if (payerID != null) {
//   //     services.executePayment(executeUrl, payerID, accessToken).then(
//   //       (id) {
//   //         if (id['error'] == false) {
//   //           widget.onSuccess(id);
//   //         } else {
//   //           widget.onError(id);
//   //         }
//   //       },
//   //     );
//   //   } else {
//   //     widget.onError('Something went wront PayerID == null');
//   //   }
//   // }
// }
