import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_form_controller.dart';
import 'package:jr_case_boilerplate/core/managers/auth/auth_manager.dart';
import 'package:jr_case_boilerplate/core/models/auth/request/login_request_model.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';
import 'package:jr_case_boilerplate/core/services/user_service.dart';

class LoginController extends BaseFormController {
  final AuthManager _authManager = AuthManager.instance;
  final UserService _userService = UserService.instance;

  LoginController() : super({'email', 'password'});

  void onSignInTap() {
    if (!validate()) return;

    setLoading(true);
    _userService
        .login(LoginRequestModel.fromJson(getFields()))
        .then((value) async {
          _authManager.saveSession(token: value.data!.token, user: value.data!);

          if (value.data?.photoUrl.isEmpty ?? true) {
            await Get.offNamed(AppRoutes.uploadPhoto);
            return;
          }

          Get.offNamed(AppRoutes.navBar);
        })
        .catchError((error) {
          setLoading(false);
        });
  }

  void onSignUpTap() {
    Get.offNamed(AppRoutes.register);
  }
}
