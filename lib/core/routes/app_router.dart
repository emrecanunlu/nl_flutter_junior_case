import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';
import 'package:jr_case_boilerplate/features/auth/views/login_view.dart';
import 'package:jr_case_boilerplate/features/auth/views/register_view.dart';
import 'package:jr_case_boilerplate/features/home/view/home_view.dart';
import 'package:jr_case_boilerplate/features/nav_bar/view/nav_bar_view.dart';
import 'package:jr_case_boilerplate/features/upload_photo/view/upload_photo_view.dart';

class AppRouter {
  AppRouter._();

  static final List<GetPage> routes = [
    // Dashboard Routes
    GetPage(name: AppRoutes.dashboard, page: () => const HomeView()),
    GetPage(name: AppRoutes.uploadPhoto, page: () => const UploadPhotoView()),
    GetPage(name: AppRoutes.navBar, page: () => const NavBarView()),

    // Auth Routes
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView()),
  ];
}
