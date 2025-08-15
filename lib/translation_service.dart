import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// Main translations class that extends GetX Translations
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'app_name': 'Structure App',
      'welcome': 'Welcome',
      'login': 'Login',
      'logout': 'Logout',
      'email': 'Email',
      'password': 'Password',
      'confirm_password': 'Confirm Password',
      'forgot_password': 'Forgot Password?',
      'sign_up': 'Sign Up',
      'home': 'Home',
      'profile': 'Profile',
      'settings': 'Settings',
      'language': 'Language',
      'theme': 'Theme',
      'dark_mode': 'Dark Mode',
      'light_mode': 'Light Mode',
      'submit': 'Submit',
      'cancel': 'Cancel',
      'save': 'Save',
      'delete': 'Delete',
      'edit': 'Edit',
      'search': 'Search',
      'loading': 'Loading...',
      'error': 'Error',
      'success': 'Success',
      'warning': 'Warning',
      'info': 'Information',
      'no_data': 'No data available',
      'retry': 'Retry',
      'back': 'Back',
      'next': 'Next',
      'previous': 'Previous',
      'done': 'Done',
      'close': 'Close',
      'ok': 'OK',
      'yes': 'Yes',
      'no': 'No',
      'username': 'Username',
      'full_name': 'Full Name',
      'phone': 'Phone',
      'address': 'Address',
      'city': 'City',
      'country': 'Country',
      'zip_code': 'ZIP Code',
      'birth_date': 'Birth Date',
      'gender': 'Gender',
      'male': 'Male',
      'female': 'Female',
      'other': 'Other',
      'prefer_not_to_say': 'Prefer not to say',
      'terms_and_conditions': 'Terms and Conditions',
      'privacy_policy': 'Privacy Policy',
      'accept': 'Accept',
      'decline': 'Decline',
      'version': 'Version',
      'about': 'About',
      'help': 'Help',
      'contact_us': 'Contact Us',
      'feedback': 'Feedback',
      'rate_app': 'Rate App',
      'share_app': 'Share App',
      'notifications': 'Notifications',
      'enable_notifications': 'Enable Notifications',
      'sound': 'Sound',
      'vibration': 'Vibration',
      'auto_update': 'Auto Update',
      'data_usage': 'Data Usage',
      'storage': 'Storage',
      'cache': 'Cache',
      'clear_cache': 'Clear Cache',
      'reset_app': 'Reset App',
      'logout_confirmation': 'Are you sure you want to logout?',
      'delete_confirmation': 'Are you sure you want to delete this item?',
      'unsaved_changes': 'You have unsaved changes. Do you want to leave without saving?',
      'network_error': 'Network error. Please check your connection.',
      'server_error': 'Server error. Please try again later.',
      'invalid_credentials': 'Invalid email or password.',
      'email_required': 'Email is required.',
      'password_required': 'Password is required.',
      'password_min_length': 'Password must be at least 6 characters.',
      'email_invalid': 'Please enter a valid email address.',
      'password_mismatch': 'Passwords do not match.',
      'field_required': 'This field is required.',
      'invalid_input': 'Invalid input.',
      'connection_timeout': 'Connection timeout. Please try again.',
      'file_too_large': 'File is too large.',
      'permission_denied': 'Permission denied.',
      'camera_permission': 'Camera permission is required.',
      'gallery_permission': 'Gallery permission is required.',
      'location_permission': 'Location permission is required.',
      'microphone_permission': 'Microphone permission is required.',
    },
    'ar_AR': {
      'app_name': 'تطبيق البنية',
      'welcome': 'مرحباً',
      'login': 'تسجيل الدخول',
      'logout': 'تسجيل الخروج',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'confirm_password': 'تأكيد كلمة المرور',
      'forgot_password': 'نسيت كلمة المرور؟',
      'sign_up': 'إنشاء حساب',
      'home': 'الرئيسية',
      'profile': 'الملف الشخصي',
      'settings': 'الإعدادات',
      'language': 'اللغة',
      'theme': 'المظهر',
      'dark_mode': 'الوضع المظلم',
      'light_mode': 'الوضع الفاتح',
      'submit': 'إرسال',
      'cancel': 'إلغاء',
      'save': 'حفظ',
      'delete': 'حذف',
      'edit': 'تعديل',
      'search': 'بحث',
      'loading': 'جاري التحميل...',
      'error': 'خطأ',
      'success': 'نجح',
      'warning': 'تحذير',
      'info': 'معلومات',
      'no_data': 'لا توجد بيانات متاحة',
      'retry': 'إعادة المحاولة',
      'back': 'رجوع',
      'next': 'التالي',
      'previous': 'السابق',
      'done': 'تم',
      'close': 'إغلاق',
      'ok': 'موافق',
      'yes': 'نعم',
      'no': 'لا',
      'username': 'اسم المستخدم',
      'full_name': 'الاسم الكامل',
      'phone': 'الهاتف',
      'address': 'العنوان',
      'city': 'المدينة',
      'country': 'البلد',
      'zip_code': 'الرمز البريدي',
      'birth_date': 'تاريخ الميلاد',
      'gender': 'الجنس',
      'male': 'ذكر',
      'female': 'أنثى',
      'other': 'آخر',
      'prefer_not_to_say': 'أفضل عدم القول',
      'terms_and_conditions': 'الشروط والأحكام',
      'privacy_policy': 'سياسة الخصوصية',
      'accept': 'قبول',
      'decline': 'رفض',
      'version': 'الإصدار',
      'about': 'حول',
      'help': 'مساعدة',
      'contact_us': 'اتصل بنا',
      'feedback': 'تعليق',
      'rate_app': 'قيّم التطبيق',
      'share_app': 'شارك التطبيق',
      'notifications': 'الإشعارات',
      'enable_notifications': 'تفعيل الإشعارات',
      'sound': 'الصوت',
      'vibration': 'الاهتزاز',
      'auto_update': 'التحديث التلقائي',
      'data_usage': 'استخدام البيانات',
      'storage': 'التخزين',
      'cache': 'الذاكرة المؤقتة',
      'clear_cache': 'مسح الذاكرة المؤقتة',
      'reset_app': 'إعادة تعيين التطبيق',
      'logout_confirmation': 'هل أنت متأكد من تسجيل الخروج؟',
      'delete_confirmation': 'هل أنت متأكد من حذف هذا العنصر؟',
      'unsaved_changes': 'لديك تغييرات غير محفوظة. هل تريد المغادرة دون حفظ؟',
      'network_error': 'خطأ في الشبكة. يرجى التحقق من الاتصال.',
      'server_error': 'خطأ في الخادم. يرجى المحاولة مرة أخرى لاحقاً.',
      'invalid_credentials': 'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
      'email_required': 'البريد الإلكتروني مطلوب.',
      'password_required': 'كلمة المرور مطلوبة.',
      'password_min_length': 'كلمة المرور يجب أن تكون 6 أحرف على الأقل.',
      'email_invalid': 'يرجى إدخال عنوان بريد إلكتروني صحيح.',
      'password_mismatch': 'كلمات المرور غير متطابقة.',
      'field_required': 'هذا الحقل مطلوب.',
      'invalid_input': 'إدخال غير صحيح.',
      'connection_timeout': 'انتهت مهلة الاتصال. يرجى المحاولة مرة أخرى.',
      'file_too_large': 'الملف كبير جداً.',
      'permission_denied': 'تم رفض الإذن.',
      'camera_permission': 'إذن الكاميرا مطلوب.',
      'gallery_permission': 'إذن المعرض مطلوب.',
      'location_permission': 'إذن الموقع مطلوب.',
      'microphone_permission': 'إذن الميكروفون مطلوب.',
    },
  };
}

// Service class for managing language operations
class TranslationService extends GetxService {
  static const String _storageKey = 'app_language';
  static const String _defaultLanguage = 'en_US';
  
  final GetStorage _storage = GetStorage();
  
  // Supported locales
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('ar', 'AR'),
  ];
  
  // Fallback locale
  static const Locale fallbackLocale = Locale('en', 'US');
  
  @override
  void onInit() {
    super.onInit();
    _initializeLanguage();
  }
  
  void _initializeLanguage() {
    final String? savedLanguage = _storage.read(_storageKey);
    if (savedLanguage != null && _isLanguageSupported(savedLanguage)) {
      changeLanguage(savedLanguage);
    } else {
      changeLanguage(_defaultLanguage);
    }
  }
  
  bool _isLanguageSupported(String languageCode) {
    return supportedLocales.any((locale) => 
      '${locale.languageCode}_${locale.countryCode}' == languageCode);
  }
  
  void changeLanguage(String languageCode) {
    if (!_isLanguageSupported(languageCode)) {
      languageCode = _defaultLanguage;
    }
    
    final List<String> parts = languageCode.split('_');
    if (parts.length == 2) {
      final Locale newLocale = Locale(parts[0], parts[1]);
      Get.updateLocale(newLocale);
      _storage.write(_storageKey, languageCode);
    }
  }
  
  String getCurrentLanguage() {
    final Locale? currentLocale = Get.locale;
    if (currentLocale != null) {
      return '${currentLocale.languageCode}_${currentLocale.countryCode}';
    }
    return _defaultLanguage;
  }
  
  bool isRTL() {
    final Locale? currentLocale = Get.locale;
    if (currentLocale != null) {
      return currentLocale.languageCode == 'ar';
    }
    return false;
  }
  
  void toggleLanguage() {
    final String currentLanguage = getCurrentLanguage();
    if (currentLanguage == 'en_US') {
      changeLanguage('ar_AR');
    } else {
      changeLanguage('en_US');
    }
  }
  
  String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en_US':
        return 'English';
      case 'ar_AR':
        return 'العربية';
      default:
        return 'English';
    }
  }
  
  String getLanguageNativeName(String languageCode) {
    switch (languageCode) {
      case 'en_US':
        return 'English';
      case 'ar_AR':
        return 'العربية';
      default:
        return 'English';
    }
  }
}
