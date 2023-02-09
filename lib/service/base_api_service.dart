import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

class BaseApiService {

  final bool trustSelfSigned = true;

  Client get client {
    return Client();
  }

  HttpClient get httpClient {
    return HttpClient()
      ..connectionTimeout = const Duration(seconds: 10)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) => trustSelfSigned);
  }

  Map<String, dynamic> getMap(Response response) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  List<Map<String, dynamic>> getArrayMap(Response response) {
    List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
    return data
      .map((e) => e as Map<String, dynamic>)
      .toList();
  }

  bool isSuccess(Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }
}
