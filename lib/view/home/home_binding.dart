import 'package:get/get.dart';
import 'package:structure/translation_service.dart';
import 'package:structure/view/home/home_controller.dart';
import '../../data/provider/api_provider.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Register API Provider
    Get.lazyPut<ApiProvider>(() => ApiProvider());
    Get.lazyPut<TranslationService>(() => TranslationService());


    
    // Register Home Controller
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
