import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  late BuildContext context;

  RxBool isLoading = false.obs;

  void setLoading(bool value) {
    isLoading.value = value;
  }
}
