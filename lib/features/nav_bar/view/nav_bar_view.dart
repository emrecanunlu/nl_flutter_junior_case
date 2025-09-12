import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/base/base_view.dart';
import 'package:jr_case_boilerplate/core/controllers/dashboard/navbar_controller.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/features/nav_bar/widgets/custom_nav_bar_item.dart';
import 'package:jr_case_boilerplate/features/home/view/home_view.dart';
import 'package:jr_case_boilerplate/features/profile/view/profile_view.dart';

class NavBarView extends BaseView<NavbarController> {
  const NavBarView({super.key});

  @override
  NavbarController get controllerType => NavbarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => buildBody()),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 0, top: 16),
        decoration: BoxDecoration(color: Get.theme.colorScheme.surface),
        child: SafeArea(
          child: Obx(() {
            return Row(
              spacing: 16,
              children: [
                CustomNavBarItem(
                  index: 0,
                  icon: AppIcons.homeFill,
                  title: 'Anasayfa',
                  isSelected: controller.selectedIndex.value == 0,
                  onTap: () => controller.onTabChanged(0),
                ),
                CustomNavBarItem(
                  index: 1,
                  icon: AppIcons.profileFill,
                  title: 'Profil',
                  isSelected: controller.selectedIndex.value == 1,
                  onTap: () => controller.onTabChanged(1),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget buildBody() {
    return IndexedStack(
      index: controller.selectedIndex.value,
      children: const [HomeView(), ProfileView()],
    );
  }
}
