import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

// Reusable rich text widget
class AuthRichText extends StatelessWidget {
  final String beforeText;
  final String clickableText;
  final String afterText;
  final VoidCallback onTap;
  final TextAlign? textAlign;
  final TextStyle? normalStyle;
  final TextStyle? clickableStyle;

  const AuthRichText({
    super.key,
    required this.beforeText,
    required this.clickableText,
    required this.afterText,
    required this.onTap,
    this.textAlign = TextAlign.center,
    this.normalStyle,
    this.clickableStyle,
  });

  // Kullanıcı sözleşmesi için factory constructor
  factory AuthRichText.termsAndConditions({
    required VoidCallback onTap,
    TextAlign? textAlign,
  }) {
    return AuthRichText(
      beforeText: 'Kullanıcı sözleşmesini okudum ve kabul ediyorum.',
      clickableText: 'Bu sözleşmeyi',
      afterText: ' okuyarak devam ediniz lütfen.',
      onTap: onTap,
      textAlign: textAlign,
    );
  }

  // Hesap yok mu, kayıt ol için factory constructor
  factory AuthRichText.signUp({
    required VoidCallback onTap,
    TextAlign? textAlign,
  }) {
    return AuthRichText(
      beforeText: 'Hesabın yok mu? ',
      clickableText: 'Kayıt Ol',
      afterText: '',
      onTap: onTap,
      textAlign: textAlign,
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultNormalStyle = Get.textTheme.bodySmall?.copyWith(
      color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.8),
    );

    final defaultClickableStyle = Get.textTheme.bodySmall?.copyWith(
      color: Get.theme.colorScheme.onSurface,
      fontWeight: FontWeight.w600,
    );

    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        children: [
          if (beforeText.isNotEmpty)
            TextSpan(
              text: beforeText,
              style: normalStyle ?? defaultNormalStyle,
            ),
          TextSpan(
            text: clickableText,
            style: clickableStyle ?? defaultClickableStyle,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
          if (afterText.isNotEmpty)
            TextSpan(text: afterText, style: normalStyle ?? defaultNormalStyle),
        ],
      ),
    );
  }
}
