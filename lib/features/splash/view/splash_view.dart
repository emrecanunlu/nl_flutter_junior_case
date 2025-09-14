import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_view.dart';
import 'package:jr_case_boilerplate/core/constants/app_spacing.dart';
import 'package:jr_case_boilerplate/core/constants/app_strings.dart';
import 'package:jr_case_boilerplate/core/controllers/splash_controller.dart';
import 'package:jr_case_boilerplate/core/widgets/app_icon/app_icon_widget.dart';
import 'package:jr_case_boilerplate/core/widgets/container/gradient_container.dart';

class SplashView extends BaseView<SplashController> {
  const SplashView({super.key});

  @override
  SplashController get controllerType => SplashController();

  @override
  Widget build(BuildContext context) {
    controller;

    return Scaffold(
      body: GradientContainer(
        width: Get.width,
        height: Get.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcon(),
            AppSpacing.verticalMd,
            Text(AppStrings.appName, style: Get.textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}
