import 'package:get/get.dart';
import 'package:structure/translation_service.dart';
import 'package:structure/presentation/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TranslationService>(() => TranslationService());

    // Register Home Controller
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
