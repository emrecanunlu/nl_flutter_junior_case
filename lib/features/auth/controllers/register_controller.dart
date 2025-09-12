import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_form_controller.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';

class RegisterController extends BaseFormController {
  RegisterController()
    : super({'fullName', 'email', 'password', 'confirmPassword'});
  RxBool isTermsAndConditionsAccepted = false.obs;

  void onSignInTap() {
    Get.offNamed(AppRoutes.login);
  }

  void onTermsAndConditionsTap(bool? value) {
    isTermsAndConditionsAccepted.value = value ?? false;
  }

  void onSignUpTap() {
    validate();
  }
}
