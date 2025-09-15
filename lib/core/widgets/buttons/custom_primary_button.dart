import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_spacing.dart';

enum ButtonVariant { default_, text }

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.variant = ButtonVariant.default_,
    this.disabled = false,
    this.isLoading = false,
  });
  final VoidCallback onPressed;
  final String title;
  final ButtonVariant variant;
  final bool disabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.buttonHeight,
      width: double.maxFinite,
      child: _buildButton(),
    );
  }

  Widget _buildButton() {
    final isButtonDisabled = disabled || isLoading;

    switch (variant) {
      case ButtonVariant.default_:
        return FilledButton(
          onPressed: isButtonDisabled ? null : onPressed,
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: AppSpacing.borderRadiusAll,
            ),
          ).copyWith(
            backgroundColor:
                isButtonDisabled
                    ? WidgetStateProperty.all(
                      Get.theme.colorScheme.primary.withValues(alpha: 0.5),
                    )
                    : null,
          ),
          child: _buildButtonChild(),
        );
      case ButtonVariant.text:
        return TextButton(
          onPressed: isButtonDisabled ? null : onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: AppSpacing.borderRadiusAll,
            ),
          ),
          child: _buildButtonChild(),
        );
    }
  }

  Widget _buildButtonChild() {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == ButtonVariant.default_
                ? Get.theme.colorScheme.onPrimary
                : Get.theme.colorScheme.primary,
          ),
        ),
      );
    }

    return Text(
      title,
      style: Get.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color:
            (disabled || isLoading)
                ? (variant == ButtonVariant.default_
                    ? Get.theme.colorScheme.onPrimary.withValues(alpha: 0.5)
                    : Get.theme.colorScheme.onSurface.withValues(alpha: 0.5))
                : null,
      ),
    );
  }
}
