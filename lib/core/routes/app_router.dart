import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';
import 'package:jr_case_boilerplate/features/auth/views/login_view.dart';
import 'package:jr_case_boilerplate/features/auth/views/register_view.dart';
import 'package:jr_case_boilerplate/features/home/view/home_view.dart';

class AppRouter {
  AppRouter._();

  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.dashboard, page: () => const HomeView()),

    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView()),
  ];
}
