import 'package:get/get.dart';
import 'package:structure/presentation/login/controller/login_controller.dart';
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Register API Provider
    

    // Register Login Controller
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
