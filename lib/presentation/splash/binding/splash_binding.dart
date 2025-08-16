import 'package:get/get.dart';
import 'package:structure/presentation/login/controller/login_controller.dart';
import 'package:structure/presentation/splash/controller/splash_controller.dart';
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Register API Provider
    

    // Register Login Controller
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
