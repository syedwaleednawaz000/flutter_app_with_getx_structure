import 'package:get/get.dart';
import 'package:structure/view/login/login_controller.dart';
import '../../data/provider/api_provider.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Register API Provider
    Get.lazyPut<ApiProvider>(() => ApiProvider());
    

    // Register Login Controller
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
