import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_controller.dart';
import 'package:jr_case_boilerplate/core/managers/auth/auth_manager.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';

class SplashController extends BaseController {
  final AuthManager _authManager = AuthManager.instance;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    _authManager.initSession().then((value) {
      if (_authManager.isAuthenticated) {
        Get.offNamed(AppRoutes.navBar);
      } else {
        Get.offNamed(AppRoutes.login);
      }
    });
  }
}
