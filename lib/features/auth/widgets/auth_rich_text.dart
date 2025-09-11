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
  final bool isUnderline;

  const AuthRichText({
    super.key,
    required this.beforeText,
    required this.clickableText,
    required this.afterText,
    required this.onTap,
    this.textAlign = TextAlign.center,
    this.normalStyle,
    this.clickableStyle,
    this.isUnderline = false,
  });

  /* Kullanıcı sözleşmesini Okudum ve Kabul ediyorum. Bu sözelşmeyi okuyarak devam ediniz lütfen. */

  factory AuthRichText.termsAndConditions({
    required VoidCallback onTap,
    TextAlign? textAlign,
  }) {
    return AuthRichText(
      beforeText: "Kullanıcı sözleşmesini ",
      clickableText: 'Okudum ve Kabul ediyorum. ',
      afterText: ' Bu sözelşmeyi okuyarak devam ediniz lütfen.',
      onTap: onTap,
      textAlign: textAlign,
      isUnderline: true,
      clickableStyle: Get.textTheme.labelLarge?.copyWith(
        color: Get.theme.colorScheme.onSurface,
        decoration: TextDecoration.underline,
      ),
      normalStyle: Get.textTheme.labelLarge?.copyWith(
        color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.6),
      ),
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
      isUnderline: false,
    );
  }

  factory AuthRichText.signIn({
    required VoidCallback onTap,
    TextAlign? textAlign,
  }) {
    return AuthRichText(
      beforeText: 'Hesabın var mı? ',
      clickableText: 'Giriş Yap',
      afterText: '',
      onTap: onTap,
      textAlign: textAlign,
      isUnderline: false,
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
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
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
