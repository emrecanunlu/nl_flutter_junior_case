import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_form_controller.dart';
import 'package:jr_case_boilerplate/core/helpers/toast_helper.dart';
import 'package:jr_case_boilerplate/core/models/auth/request/login_request_model.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';
import 'package:jr_case_boilerplate/core/services/user_service.dart';

class LoginController extends BaseFormController {
  final UserService userService = UserService.instance;

  LoginController() : super({'email', 'password'});

  void onSignInTap() {
    if (!validate()) return;

    userService.login(LoginRequestModel.fromJson(getFields())).then((value) {});
  }

  void onSignUpTap() {
    Get.offNamed(AppRoutes.register);
  }
}
