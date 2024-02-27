import 'package:get/get.dart';

class ClientAPI extends GetConnect implements GetxService {
  late String token;
  late Map<String, String> _mainHeaders;
  final String appBaseURL;

  ClientAPI({
    required this.appBaseURL,
  }) {
    baseUrl = appBaseURL;
    timeout = Duration(seconds: 30);
    token = '';
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  // This is showing the RestFull API Functions:
  Future<Response> getData(
      {required String url, Map<String, String>? headers}) async {
    try {
      Response response = await get(
        url,
        headers: headers ?? _mainHeaders,
      );
      return response;
    } catch (ex) {
      return Response(statusCode: 1, statusText: ex.toString());
    }
  }

  Future<Response> postData(
      {required String url,
      required dynamic body,
      Map<String, String>? headers}) async {
    try {
      Response response = await post(
        url,
        body,
        headers: headers ?? _mainHeaders,
      );
      return response;
    } catch (ex) {
      return Response(
        statusCode: 1,
        statusText: ex.toString(),
      );
    }
  }
}
