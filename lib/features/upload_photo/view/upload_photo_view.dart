import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_view.dart';
import 'package:jr_case_boilerplate/core/controllers/dashboard/upload_photo_controller.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_icon_button.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/core/widgets/container/gradient_container.dart';
import 'package:jr_case_boilerplate/features/upload_photo/widgets/photo_picker.dart';

class UploadPhotoView extends BaseView<UploadPhotoController> {
  const UploadPhotoView({super.key});

  @override
  UploadPhotoController get controllerType => UploadPhotoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [buildHeader(), buildUploadArea(), buildFooter()],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (Get.routing.isBack ?? false)
            Align(
              alignment: Alignment.centerLeft,
              child: CustomIconButton(
                onPressed: () {},
                icon: AppIcons.arrow,
                width: 44,
                height: 40,
              ),
            ),
          Text(
            'screen.uploadPhoto.title'.tr,
            style: Get.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPersonIcon() {
    return Container(
      width: 76,
      height: 76,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        AppIcons.profileFill.path,
        width: 32,
        height: 40,
        colorFilter: ColorFilter.mode(
          Get.theme.colorScheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget buildUploadTitle() {
    return Text(
      'screen.uploadPhoto.uploadTitle'.tr,
      style: Get.textTheme.titleLarge,
    );
  }

  Widget buildUploadSubtitle() {
    return SizedBox(
      width: 200,
      child: Text(
        'screen.uploadPhoto.uploadSubtitle'.tr,
        style: Get.textTheme.bodySmall?.copyWith(
          color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.9),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildPhotoPicker() {
    return Obx(() {
      return PhotoPicker(
        size: 200,
        onSelectImageTap: controller.onPhotoPickerTap,
        path: controller.selectedImagePath.value,
        onClearImage: controller.clearSelectedImagePath,
        isPicking: controller.isPicking.value,
      );
    });
  }

  Widget buildContinueButton() {
    return Obx(() {
      return CustomPrimaryButton(
        onPressed: controller.onContinueTap,
        title: 'common.continue'.tr,
        disabled: controller.selectedImagePath.value == null,
        isLoading: controller.isUploading.value,
      );
    });
  }

  Widget buildSkipButton() {
    return CustomPrimaryButton(
      onPressed: controller.onSkipTap,
      title: 'common.skip'.tr,
      variant: ButtonVariant.text,
      disabled: controller.isUploading.value,
    );
  }

  Widget buildUploadArea() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildPersonIcon(),
        const SizedBox(height: 16),
        buildUploadTitle(),
        const SizedBox(height: 12),
        buildUploadSubtitle(),
        const SizedBox(height: 52),
        buildPhotoPicker(),
      ],
    );
  }

  Widget buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          buildContinueButton(),
          const SizedBox(height: 12),
          buildSkipButton(),
        ],
      ),
    );
  }
}
