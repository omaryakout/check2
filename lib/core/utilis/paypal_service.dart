import 'dart:convert';

import 'package:dio/dio.dart';

class PaypalService {
  var dio = Dio();

 Future<String> getToken({required id, required secretkey}) async {
    var data = {'grant_type': 'client_credentials'};
    String clientId = 'your_client_id';
    String clientSecret = 'your_client_secret';
    String credentials = base64Encode(utf8.encode('$id:$secretkey'));
    var response = await dio.post(
      'https://api-m.sandbox.paypal.com/v1/oauth2/token',
      options: Options(headers: {
        'Authorization': 'Basic $credentials',
        'Content-Type': 'application/x-www-form-urlencoded',
      }),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      print(response.data['access_token']);
    } else {
      print(response.statusMessage);
    }
    return response.data['access_token'];
  }

  makePayment(String accessToken) async {
    var data = {
      "intent": "CAPTURE",
      "purchase_units": [
        {
          "amount": {"currency_code": "USD", "value": "106.00"}
        }
      ]
    };

    var response = await dio.post(
      "https://api-m.sandbox.paypal.com/v2/checkout/orders",
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
          'Prefer': 'return=representation'
        },
      ),
      data: data,
    );

    if (response.statusCode == 201) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  void executePayment(String id, String secretkey) async {
    var response = await getToken(id: id, secretkey: secretkey);
    var res = await makePayment(response);
    print(res);
  }
}
