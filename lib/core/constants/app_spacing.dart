import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılan spacing ve padding değerlerini merkezi olarak yönetir
class AppSpacing {
  AppSpacing._();

  // Base spacing unit - 4px
  static const double _baseUnit = 4.0;

  // Spacing değerleri (8'li sistem)
  static const double xs = _baseUnit * 1; // 4px
  static const double sm = _baseUnit * 2; // 8px
  static const double md = _baseUnit * 3; // 12px
  static const double lg = _baseUnit * 4; // 16px
  static const double xl = _baseUnit * 6; // 24px
  static const double xxl = _baseUnit * 8; // 32px
  static const double xxxl = _baseUnit * 12; // 48px

  // Özel spacing değerleri
  static const double buttonHeight = 56.0;
  static const double inputFieldHeight = 58.0;
  static const double iconSize = 24.0;
  static const double avatarSize = 56.0;
  static const double borderRadius = 16.0;
  static const double borderRadiusSmall = 8.0;

  // Screen padding
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets screenPaddingVertical = EdgeInsets.symmetric(
    vertical: xxl,
  );
  static const EdgeInsets screenPaddingAll = EdgeInsets.all(xl);

  // Component padding
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: xl,
    vertical: lg,
  );
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: xl,
    vertical: lg,
  );
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: xl,
    vertical: md,
  );

  // Spacing between elements
  static const EdgeInsets elementSpacing = EdgeInsets.only(bottom: lg);
  static const EdgeInsets sectionSpacing = EdgeInsets.only(bottom: xxl);
  static const EdgeInsets formSpacing = EdgeInsets.only(bottom: lg);

  // Grid spacing
  static const double gridSpacing = lg;
  static const double gridCrossAxisSpacing = lg;
  static const double gridMainAxisSpacing = lg;

  // Navigation
  static const EdgeInsets navBarPadding = EdgeInsets.only(
    left: xl,
    right: xl,
    top: lg,
    bottom: 0,
  );

  // Bottom sheet
  static const EdgeInsets bottomSheetPadding = EdgeInsets.all(xl);
  static const EdgeInsets bottomSheetContentPadding = EdgeInsets.symmetric(
    horizontal: xl,
    vertical: lg,
  );

  // Profile specific
  static const EdgeInsets profileHeaderPadding = EdgeInsets.symmetric(
    horizontal: xl,
    vertical: md,
  );
  static const EdgeInsets profileButtonPadding = EdgeInsets.symmetric(
    horizontal: 19,
    vertical: 10,
  );

  // Home specific
  static const EdgeInsets homeContentPadding = EdgeInsets.symmetric(
    horizontal: xl,
    vertical: xxl,
  );
  static const EdgeInsets homeGridPadding = EdgeInsets.only(
    bottom: xl,
    top: 20,
  );

  // Auth specific
  static const EdgeInsets authFormPadding = EdgeInsets.symmetric(
    horizontal: xl,
  );
  static const EdgeInsets socialButtonSpacing = EdgeInsets.symmetric(
    horizontal: 15,
  );

  // Icon padding
  static const EdgeInsets iconPadding = EdgeInsets.only(
    left: 20,
    right: sm,
    top: md,
    bottom: md,
  );
  static const EdgeInsets suffixIconPadding = EdgeInsets.only(
    left: 10,
    right: 20,
    top: md,
    bottom: md,
  );

  // Content padding
  static const EdgeInsets contentPadding = EdgeInsets.only(
    left: 0,
    right: xl,
    top: lg,
    bottom: lg,
  );

  // SizedBox helpers
  static const SizedBox spaceXs = SizedBox(height: xs, width: xs);
  static const SizedBox spaceSm = SizedBox(height: sm, width: sm);
  static const SizedBox spaceMd = SizedBox(height: md, width: md);
  static const SizedBox spaceLg = SizedBox(height: lg, width: lg);
  static const SizedBox spaceXl = SizedBox(height: xl, width: xl);
  static const SizedBox spaceXxl = SizedBox(height: xxl, width: xxl);

  // Vertical spacing
  static const SizedBox verticalXs = SizedBox(height: xs);
  static const SizedBox verticalSm = SizedBox(height: sm);
  static const SizedBox verticalMd = SizedBox(height: md);
  static const SizedBox verticalLg = SizedBox(height: lg);
  static const SizedBox verticalXl = SizedBox(height: xl);
  static const SizedBox verticalXxl = SizedBox(height: xxl);

  // Horizontal spacing
  static const SizedBox horizontalXs = SizedBox(width: xs);
  static const SizedBox horizontalSm = SizedBox(width: sm);
  static const SizedBox horizontalMd = SizedBox(width: md);
  static const SizedBox horizontalLg = SizedBox(width: lg);
  static const SizedBox horizontalXl = SizedBox(width: xl);
  static const SizedBox horizontalXxl = SizedBox(width: xxl);

  // Border radius
  static const BorderRadius borderRadiusAll = BorderRadius.all(
    Radius.circular(borderRadius),
  );
  static const BorderRadius borderRadiusSmallAll = BorderRadius.all(
    Radius.circular(borderRadiusSmall),
  );
  static const BorderRadius borderRadiusCircular = BorderRadius.all(
    Radius.circular(avatarSize),
  );

  // Size constraints
  static const BoxConstraints buttonConstraints = BoxConstraints(
    minHeight: buttonHeight,
  );
  static const BoxConstraints inputConstraints = BoxConstraints(
    minHeight: inputFieldHeight,
  );
}
