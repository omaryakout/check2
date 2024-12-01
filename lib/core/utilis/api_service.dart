import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();

  Future<Response> post(
      {required body,
      required String url,
      
       Map<String ,String>? headers ,
      String? contentType}) async {
    final response = await dio.post(url,
        data: body,
        options: Options(
            contentType: contentType,
            headers: headers));
    return response;
  }
}
