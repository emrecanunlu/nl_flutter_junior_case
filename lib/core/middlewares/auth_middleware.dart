import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:jr_case_boilerplate/core/managers/auth/auth_manager.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  final AuthManager _authManager = AuthManager.instance;

  @override
  RouteSettings? redirect(String? route) {
    if (_authManager.isAuthenticated) {
      return null;
    }
    return RouteSettings(name: AppRoutes.login);
  }
}
