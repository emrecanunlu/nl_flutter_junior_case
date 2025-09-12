import 'package:dio/dio.dart';
import 'package:jr_case_boilerplate/core/helpers/toast_helper.dart';
import 'package:get/get.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message = _getErrorMessage(err);

    ToastHelper.error(message);
    handler.next(err);
  }

  String _getErrorMessage(DioException err) {
    // Backend response'u kontrol et
    final responseData = err.response?.data;
    if (responseData is Map<String, dynamic>) {
      final response = responseData['response'];
      if (response is Map<String, dynamic>) {
        final backendMessage = response['message'];
        return _getLocalizedMessage(backendMessage);
      }
    }

    // Network hataları
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return 'error.connectionTimeout'.tr;
      case DioExceptionType.sendTimeout:
        return 'error.sendTimeout'.tr;
      case DioExceptionType.receiveTimeout:
        return 'error.connectionTimeout'.tr;
      case DioExceptionType.connectionError:
        return 'error.connectionError'.tr;
      default:
        return 'error.unknownError'.tr;
    }
  }

  String _getLocalizedMessage(String backendMessage) {
    switch (backendMessage) {
      case 'INVALID_CREDENTIALS':
        return 'error.invalidCredentials'.tr;
      case 'USER_NOT_FOUND':
        return 'error.userNotFound'.tr;
      case 'EMAIL_ALREADY_EXISTS':
        return 'error.emailAlreadyExists'.tr;
      default:
        return 'error.unknownError'.tr;
    }
  }
}
