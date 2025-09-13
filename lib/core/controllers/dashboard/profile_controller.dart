import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/base/base_controller.dart';
import 'package:jr_case_boilerplate/core/managers/auth/auth_manager.dart';
import 'package:jr_case_boilerplate/core/models/user/response/user_model.dart';

class ProfileController extends BaseController {
  final AuthManager _authManager = AuthManager.instance;

  UserModel get user => _authManager.user;

  var u = 10;

  ProfileController() {
    debugPrint('ProfileController constructor');
  }

  @override
  void onInit() {
    debugPrint('ProfileController onInit');
    super.onInit();
  }
}
