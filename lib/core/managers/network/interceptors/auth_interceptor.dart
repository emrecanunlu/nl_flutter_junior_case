import 'package:dio/dio.dart';
import 'package:jr_case_boilerplate/core/managers/auth/auth_manager.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // AuthManager'dan token al
    final token = AuthManager.instance.token;

    // Token varsa Authorization header'ına ekle
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
