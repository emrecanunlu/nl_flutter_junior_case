import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'base_controller.dart';

abstract class BaseView<T extends BaseController> extends StatelessWidget {
  const BaseView({super.key});

  // Controller'ı al veya oluştur
  T get controller => Get.put(controllerType);

  // Controller tipini belirt (override edilmeli)
  T get controllerType;

  // Sayfa widget'ı (override edilmeli)
  @override
  Widget build(BuildContext context);
}
