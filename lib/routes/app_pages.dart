import 'package:get/get.dart';
import 'package:structure/presentation/home/view/home_page.dart';
import 'package:structure/presentation/login/view/login_page.dart';
import 'package:structure/presentation/splash/binding/splash_binding.dart';
import 'package:structure/presentation/splash/view/splash_page.dart';


import '../presentation//home/binding/home_binding.dart';
import '../presentation/login/binding/login_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
