import 'package:flutter/material.dart';
import 'app_spacing.dart';

/// Deprecated: AppSpacing sınıfını kullanın
/// Bu dosya geriye dönük uyumluluk için korunmuştur
@Deprecated('AppSpacing sınıfını kullanın')
class AppPaddings {
  AppPaddings._();

  @Deprecated('AppSpacing.screenPadding kullanın')
  static const EdgeInsets screenPadding = AppSpacing.screenPadding;

  @Deprecated('AppSpacing.cardPadding kullanın')
  static const EdgeInsets cardPadding = AppSpacing.cardPadding;

  @Deprecated('AppSpacing.buttonPadding kullanın')
  static const EdgeInsets buttonPadding = AppSpacing.buttonPadding;
}
