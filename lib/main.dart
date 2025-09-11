import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constants/app_themes.dart';
import 'core/localization/app_translations.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';

void main() {
  runApp(const ShartFlix());
}

class ShartFlix extends StatelessWidget {
  const ShartFlix({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ShartFlix',
      theme: AppThemes.darkTheme,
      translations: AppTranslations(),
      initialRoute: AppRoutes.login, // İlk route
      locale: const Locale('tr', 'TR'),
      getPages: AppRouter.routes, // Route listesi
      debugShowCheckedModeBanner: false, // Debug banner'ı gizle
    );
  }
}
