import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_form_controller.dart';
import 'package:jr_case_boilerplate/core/managers/auth/auth_manager.dart';
import 'package:jr_case_boilerplate/core/helpers/toast/toast_helper.dart';
import 'package:jr_case_boilerplate/core/models/auth/request/register_request_model.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';
import 'package:jr_case_boilerplate/core/services/user_service.dart';

class RegisterController extends BaseFormController {
  final UserService userService = UserService.instance;

  RegisterController()
    : super({'name', 'email', 'password', 'confirmPassword'});
  RxBool isTermsAndConditionsAccepted = false.obs;

  void onSignInTap() {
    Get.offNamed(AppRoutes.login);
  }

  void onTermsAndConditionsTap(bool? value) {
    isTermsAndConditionsAccepted.value = value ?? false;
  }

  void onSignUpTap() {
    if (!validate()) return;

    if (!isTermsAndConditionsAccepted.value) {
      ToastHelper.error("error.termsAndConditions".tr);
      return;
    }

    setLoading(true);

    userService
        .register(RegisterRequestModel.fromJson(getFields()))
        .then((value) async {
          await AuthManager.instance.saveSession(
            token: value.data!.token,
            user: value.data!,
          );

          ToastHelper.success("common.registerSuccess".tr);
          Get.offNamed(AppRoutes.login);
        })
        .catchError((error) {
          setLoading(false);
        });
  }
}
