import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.maxFinite,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          title,
          style: Get.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
