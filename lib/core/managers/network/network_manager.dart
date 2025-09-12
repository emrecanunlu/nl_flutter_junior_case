import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jr_case_boilerplate/core/managers/network/interceptors/error_interceptor.dart';

class NetworkManager {
  late Dio dio;

  static NetworkManager? _instance;
  static NetworkManager get instance => _instance ??= NetworkManager._();

  NetworkManager._() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://caseapi.servicelabs.tech',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    // Error handling interceptor
    dio.interceptors.add(ErrorInterceptor());

    // Logging interceptor (sadece debug modda)
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
        ),
      );
    }
  }
}
