import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/base/base_view.dart';
import 'package:jr_case_boilerplate/features/auth/controllers/login_controller.dart';

class LoginView extends BaseView<LoginController> {
  const LoginView({super.key});

  @override
  LoginController get controllerType => LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
