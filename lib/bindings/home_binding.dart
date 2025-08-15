import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../data/provider/api_provider.dart';
import '../data/repository/user_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Register API Provider
    Get.lazyPut<ApiProvider>(() => ApiProvider());
    
    // Register User Repository
    Get.lazyPut<UserRepository>(() => UserRepository());
    
    // Register Home Controller
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
