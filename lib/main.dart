import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/managers/cache/cache_manager.dart';
import 'core/constants/app_themes.dart';
import 'core/constants/app_translations.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';

Future<void> appInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.instance.init();
}

void main() async {
  await appInit();
  runApp(const ShartFlix());
}

class ShartFlix extends StatelessWidget {
  const ShartFlix({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ShartFlix', // Title
      themeMode: ThemeMode.dark, // ThemeMode
      theme: AppThemes.darkTheme, // Theme
      translations: AppTranslations(), // Translations
      initialRoute: AppRoutes.splash, // İlk route
      locale: AppTranslations.locale, // Locale
      getPages: AppRouter.routes, // Route listesi
      debugShowCheckedModeBanner: false, // Debug banner'ı gizle
    );
  }
}
