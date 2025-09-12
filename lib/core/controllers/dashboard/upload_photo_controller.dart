import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jr_case_boilerplate/core/base/base_controller.dart';
import 'package:jr_case_boilerplate/core/managers/auth/auth_manager.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';
import 'package:jr_case_boilerplate/core/services/user_service.dart';

class UploadPhotoController extends BaseController {
  Rx<String?> selectedImagePath = Rx<String?>(null);
  RxBool isPicking = false.obs;
  RxBool isUploading = false.obs;

  final UserService _userService = UserService.instance;
  final AuthManager _authManager = AuthManager.instance;

  @override
  void onInit() {
    super.onInit();
    // AuthManager'dan mevcut user photo'yu al
    final currentUser = AuthManager.instance.user;
    if (currentUser.photoUrl.isNotEmpty) {
      selectedImagePath.value = currentUser.photoUrl;
    }
  }

  void onPhotoPickerTap() async {
    try {
      isPicking.value = true;
      final photo = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (photo != null) {
        selectedImagePath.value = photo.path;
      }
    } finally {
      isPicking.value = false;
    }
  }

  void clearSelectedImagePath() {
    selectedImagePath.value = null;
  }

  Future<void> uploadPhoto() async {
    try {
      isUploading.value = true;

      final file = File(selectedImagePath.value!);
      final result = await _userService.uploadPhoto(file);

      // AuthManager'da user'ı güncelle
      await _authManager.updateSession(user: result.data!);

      Get.offNamed(AppRoutes.dashboard);
    } catch (e) {
      debugPrint('uploadPhoto error: $e');
    } finally {
      isUploading.value = false;
    }
  }

  void onContinueTap() {
    if (selectedImagePath.value != null) {
      uploadPhoto();
    } else {
      Get.offNamed(AppRoutes.dashboard);
    }
  }

  void onSkipTap() {
    Get.offNamed(AppRoutes.dashboard);
  }
}
