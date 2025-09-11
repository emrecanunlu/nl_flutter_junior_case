import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_controller.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';

class LoginController extends BaseController {
  void onSignUpTap() {
    Get.offNamed(AppRoutes.register);
  }
}
