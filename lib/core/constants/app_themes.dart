import 'package:flutter/material.dart';
import 'app_text_styles.dart';
import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'InstrumentSans',
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.primaryDark,
      onPrimaryContainer: AppColors.white,

      // Secondary colors
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.brandSecondary,
      onSecondaryContainer: AppColors.white,

      // Surface colors
      surface: AppColors.black,
      onSurface: AppColors.white,
      surfaceContainerHighest: AppColors.white10,
      onSurfaceVariant: AppColors.white70,

      // Error colors
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: AppColors.error,
      onErrorContainer: AppColors.white,

      // Outline
      outline: AppColors.white30,
      outlineVariant: AppColors.white20,

      // Shadow
      shadow: AppColors.black,
      scrim: AppColors.black,

      // Inverse
      inverseSurface: AppColors.white,
      onInverseSurface: AppColors.black,
      inversePrimary: AppColors.primary,
    ),

    textTheme: const TextTheme(
      // Headings
      headlineLarge: AppTextStyles.heading1,
      headlineMedium: AppTextStyles.heading2,
      headlineSmall: AppTextStyles.heading3,
      titleLarge: AppTextStyles.heading4,
      titleMedium: AppTextStyles.heading5,
      titleSmall: AppTextStyles.heading6,

      // Body XLarge
      bodyLarge: AppTextStyles.bodyXLargeRegular,

      // Body Large
      bodyMedium: AppTextStyles.bodyLargeRegular,

      // Body Medium
      bodySmall: AppTextStyles.bodyMediumRegular,

      // Body Small
      labelLarge: AppTextStyles.bodySmallRegular,

      // Body XSmall
      labelMedium: AppTextStyles.bodyXSmallRegular,
      labelSmall: AppTextStyles.bodyXSmallRegular,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white5,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white20),
        borderRadius: BorderRadius.circular(18),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white20),
        borderRadius: BorderRadius.circular(18),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white20),
        borderRadius: BorderRadius.circular(18),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.circular(18),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.circular(18),
      ),
    ),

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.white5;
      }),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.white;
        }

        return AppColors.white5;
      }),
      side: BorderSide(color: AppColors.white20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: AppColors.white20),
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'InstrumentSans',
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.primaryDark,
      onPrimaryContainer: AppColors.white,

      // Secondary colors
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.brandSecondary,
      onSecondaryContainer: AppColors.white,

      // Surface colors
      surface: AppColors.white,
      onSurface: AppColors.black,
      surfaceContainerHighest: AppColors.white10,
      onSurfaceVariant: AppColors.white70,

      // Error colors
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: AppColors.error,
      onErrorContainer: AppColors.white,

      // Outline
      outline: AppColors.white30,
      outlineVariant: AppColors.white20,

      // Shadow
      shadow: AppColors.white,
      scrim: AppColors.white,

      // Inverse
      inverseSurface: AppColors.white,
      onInverseSurface: AppColors.white,
      inversePrimary: AppColors.primary,
    ),

    textTheme: const TextTheme(
      // Headings
      headlineLarge: AppTextStyles.heading1,
      headlineMedium: AppTextStyles.heading2,
      headlineSmall: AppTextStyles.heading3,
      titleLarge: AppTextStyles.heading4,
      titleMedium: AppTextStyles.heading5,
      titleSmall: AppTextStyles.heading6,

      // Body XLarge
      bodyLarge: AppTextStyles.bodyXLargeRegular,

      // Body Large
      bodyMedium: AppTextStyles.bodyLargeRegular,

      // Body Medium
      bodySmall: AppTextStyles.bodyMediumRegular,

      // Body Small
      labelLarge: AppTextStyles.bodySmallRegular,

      // Body XSmall
      labelMedium: AppTextStyles.bodyXSmallRegular,
      labelSmall: AppTextStyles.bodyXSmallRegular,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white5,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white20),
        borderRadius: BorderRadius.circular(18),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white20),
        borderRadius: BorderRadius.circular(18),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white20),
        borderRadius: BorderRadius.circular(18),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.circular(18),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.circular(18),
      ),
    ),

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.white5;
      }),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.white;
        }

        return AppColors.white5;
      }),
      side: BorderSide(color: AppColors.white20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: AppColors.white20),
      ),
    ),
  );
}
