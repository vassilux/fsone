import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const baseUrl = "https://demo.esifrance.net:8001";
  static const serviceUri = "ServiceS1/rest";

  Future<String> get(String endpoint, Map<String, String> qParams) async {
    var dio = new Dio();
    var options = new Options(method: "get");
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers['userName'] = 'fred';
    options.headers['password'] = 'fred';
    options.contentType = 'application/json';
    String url = '$baseUrl/$serviceUri/Login';
    print("params : $qParams");

    try {
      if (Platform.isAndroid) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          print(" ignore https");
          return client;
        };
      }   

      Response response =
          await dio.get(url, options: options, queryParameters: qParams);
      print(response);
      return response.data;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
