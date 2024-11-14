import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:education/core/network/network_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio(
        BaseOptions(
          baseUrl: NetworkConstant.baseUrl,
        ),

      );
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut..options
      ..options.headers['authorization'] =
      'Basic ${base64Encode(utf8.encode('${NetworkConstant.consumerKey}:${NetworkConstant.secretKey}'))}';
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

}
