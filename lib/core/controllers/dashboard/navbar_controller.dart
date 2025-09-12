import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_controller.dart';

class NavbarController extends BaseController {
  RxInt selectedIndex = 0.obs;

  void onTabChanged(int index) {
    selectedIndex.value = index;
  }
}
