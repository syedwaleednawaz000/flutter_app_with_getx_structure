import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:structure/translation_service.dart';


class HomeController extends GetxController {
  final RxBool isDarkMode = false.obs; // For theme toggle
  final GetStorage _storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // Load saved theme mode
    Future.microtask(() {
      isDarkMode.value = _storage.read('isDarkMode') ?? false;
      Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    });
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    _storage.write('isDarkMode', isDarkMode.value);
  }

  // Show settings dialog
  Future<void> setting() async {
    Get.defaultDialog(
      title: 'settings'.tr,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          // Theme Change Button
          ElevatedButton(
            onPressed: toggleTheme,
            child: Text('theme'.tr),
          ),
          const SizedBox(height: 10),
        ],
      ),
      confirm: TextButton(
        onPressed: () => Get.back(),
        child: Text('close'.tr),
      ),
    );
  }

  void language (){
    Get.defaultDialog(
      title: 'language'.tr,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${'choose_an_option'.tr}:'),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Get.find<TranslationService>().changeLanguage('en_US');
              Get.back();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (Get.find<TranslationService>().getCurrentLanguage() == 'en_US')
                  Icon(
                    Icons.check_circle,
                    color: Theme.of(Get.context!).colorScheme.primary,
                    size: 20,
                  ),
                if (Get.find<TranslationService>().getCurrentLanguage() == 'en_US')
                  const SizedBox(width: 8),
                Text(
                  'English',
                  style: TextStyle(
                    fontWeight: Get.find<TranslationService>().getCurrentLanguage() == 'en_US' 
                        ? FontWeight.bold 
                        : FontWeight.normal,
                    color: Get.find<TranslationService>().getCurrentLanguage() == 'en_US' 
                        ? Theme.of(Get.context!).colorScheme.primary 
                        : null,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Get.find<TranslationService>().changeLanguage('ar_SA');
              Get.back();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (Get.find<TranslationService>().getCurrentLanguage() == 'ar_SA')
                  Icon(
                    Icons.check_circle,
                    color: Theme.of(Get.context!).colorScheme.primary,
                    size: 20,
                  ),
                if (Get.find<TranslationService>().getCurrentLanguage() == 'ar_SA')
                  const SizedBox(width: 8),
                Text(
                  'العربية',
                  style: TextStyle(
                    fontWeight: Get.find<TranslationService>().getCurrentLanguage() == 'ar_SA' 
                        ? FontWeight.bold 
                        : FontWeight.normal,
                    color: Get.find<TranslationService>().getCurrentLanguage() == 'ar_SA' 
                        ? Theme.of(Get.context!).colorScheme.primary 
                        : null,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${'current_language'.tr}: ${Get.find<TranslationService>().getCurrentLanguageDisplayName()}',
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
  // Logout
  Future<void> logout() async {
    Get.defaultDialog(
      title: 'logout'.tr,
      content: Text('logout_confirmation'.tr),
      confirm: TextButton(
        onPressed: () {
          Get.back();
          Get.offAllNamed('/login');
        },
        child: Text('yes'.tr),
      ),
      cancel: TextButton(
        onPressed: () => Get.back(),
        child: Text('no'.tr),
      ),
    );
  }
}
