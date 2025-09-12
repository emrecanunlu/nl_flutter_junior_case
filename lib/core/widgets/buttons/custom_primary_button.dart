import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ButtonVariant { default_, text }

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.variant = ButtonVariant.default_,
    this.disabled = false,
  });
  final VoidCallback onPressed;
  final String title;
  final ButtonVariant variant;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 56, width: double.maxFinite, child: _buildButton());
  }

  Widget _buildButton() {
    switch (variant) {
      case ButtonVariant.default_:
        return FilledButton(
          onPressed: disabled ? null : onPressed,
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ).copyWith(
            backgroundColor:
                disabled
                    ? WidgetStateProperty.all(
                      Get.theme.colorScheme.primary.withValues(alpha: 0.5),
                    )
                    : null,
          ),
          child: Text(
            title,
            style: Get.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color:
                  disabled
                      ? Get.theme.colorScheme.onPrimary.withValues(alpha: 0.5)
                      : null,
            ),
          ),
        );
      case ButtonVariant.text:
        return TextButton(
          onPressed: disabled ? null : onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            title,
            style: Get.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color:
                  disabled
                      ? Get.theme.colorScheme.onSurface.withValues(alpha: 0.5)
                      : null,
            ),
          ),
        );
    }
  }
}
