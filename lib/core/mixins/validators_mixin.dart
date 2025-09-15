import 'package:get/get.dart';

mixin ValidatorsMixin {
  String? validateRequiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Bu alan gereklidir';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'validation.required'.tr;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return 'validation.invalidEmail'.tr;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.required'.tr;
    }
    if (value.length < 6) {
      return 'validation.invalidPassword'.trParams({'length': '6'});
    }
    return null;
  }

  String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'validation.required'.tr;
    }
    if (value.trim().length < 2) {
      return 'validation.minLength'.trParams({'length': '2'});
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'validation.required'.tr;
    }
    if (value != password) {
      return 'validation.invalidConfirmPassword'.tr;
    }
    return null;
  }
}
