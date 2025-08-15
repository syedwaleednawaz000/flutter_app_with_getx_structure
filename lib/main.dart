import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'config/app_constants.dart';
import 'config/theme.dart';
import 'routes/app_pages.dart';
import 'translation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage
  await GetStorage.init();
  
  // Initialize TranslationService
  final translationService = Get.put(TranslationService());

  // Load saved theme mode
  final bool isDarkMode = GetStorage().read('isDarkMode') ?? false;
  final ThemeMode themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

  // Get current locale from TranslationService
  final Locale currentLocale = translationService.getCurrentLocale();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(MyApp(themeMode: themeMode, locale: currentLocale));
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  final Locale locale;

  const MyApp({
    super.key,
    required this.themeMode,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,

      // Theme configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,

      // Localization configuration
      locale: locale,
      fallbackLocale: TranslationService.fallbackLocale,
      supportedLocales: TranslationService.supportedLocales,
      
      // Localization delegates for proper ar_SA support
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // Translations
      translations: AppTranslations(),

      // Routing configuration
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,

      // Default transitions
      defaultTransition: Transition.fadeIn,

      // Error handling
      onUnknownRoute: (settings) {
        return GetPageRoute(
          page: () => const Scaffold(
            body: Center(
              child: Text('page_not_found'),
            ),
          ),
        );
      },

      // Prevent text scaling from system settings
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}
