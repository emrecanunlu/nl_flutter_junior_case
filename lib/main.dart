import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/managers/auth/auth_manager.dart';
import 'package:jr_case_boilerplate/core/managers/cache/cache_manager.dart';
import 'core/constants/app_themes.dart';
import 'core/constants/app_translations.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.instance.init();
  await AuthManager.instance.initSession();
  runApp(const ShartFlix());
}

class ShartFlix extends StatelessWidget {
  const ShartFlix({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ShartFlix',
      themeMode: ThemeMode.dark,
      theme: AppThemes.darkTheme,
      translations: AppTranslations(),
      initialRoute: AppRoutes.navBar, // İlk route
      locale: const Locale('tr', 'TR'),
      getPages: AppRouter.routes, // Route listesi
      debugShowCheckedModeBanner: false, // Debug banner'ı gizle
    );
  }
}
