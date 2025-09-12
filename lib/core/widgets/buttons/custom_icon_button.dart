import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.width,
    required this.height,
  });
  final VoidCallback onPressed;
  final AppIcons icon;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Get.theme.colorScheme.onSurface.withValues(
            alpha: 0.05,
          ),
          side: BorderSide(
            color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.2),
          ),
          padding: EdgeInsets.zero, // Button'un kendi padding'ini kaldır
        ),
        child: SvgPicture.asset(
          icon.path,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            Get.theme.colorScheme.onSurface,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
