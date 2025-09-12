import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_form_controller.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';

class LoginController extends BaseFormController {
  LoginController() : super({'email', 'password'});
  void onSignInTap() {
    validate();
  }

  void onSignUpTap() {
    Get.offNamed(AppRoutes.register);
  }
}
