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
      'welcome_back': 'Welcome Back!',
      'sign_in_continue': 'Sign in to continue to your account',
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
      'choose_an_option': 'Choose an option',
      'enter_email': 'Enter your email address',
      'enter_password': 'Enter your password',
      'remember_me': 'Remember me',
      'dont_have_account': "Don't have an account?",
      'already_have_account': 'Already have an account?',
      'email_too_long': 'Email is too long',
      'password_too_long': 'Password is too long',
      'invalid_email_or_password': 'Invalid email or password',
      'enter_email_first': 'Please enter your email address first',
      'reset_link_sent': 'Password reset link sent to your email',
      'reset_link_will_sent': 'Reset link will be sent to',
      'forgot_password_title': 'Forgot Password',
      'error_title': 'Error',
      'success_title': 'Success',
      'login_successful': 'Login successful!',
      'login_failed': 'Login failed',
      'info_title': 'Info',
      'signup_coming_soon': 'Sign up functionality coming soon',
      'send_reset_link': 'Send Reset Link',
      'current_language': 'Current Language',
      'or': 'OR',
      'demo_credentials': 'Demo Credentials',
      'demo_credentials_info': 'Admin: admin@example.com / password123\nUser: user@example.com / password123',
      'welcome_user': 'Welcome, User',
      'app_tagline': 'Building the future, one structure at a time',
      'page_not_found': 'Page not found',
    },
    'ar_SA': {
      'app_name': 'تطبيق البنية',
      'welcome': 'مرحباً',
      'welcome_back': 'مرحباً بعودتك!',
      'sign_in_continue': 'سجل دخولك للمتابعة إلى حسابك',
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
      'choose_an_option': 'اختر خياراً',
      'enter_email': 'أدخل عنوان بريدك الإلكتروني',
      'enter_password': 'أدخل كلمة المرور',
      'remember_me': 'تذكرني',
      'dont_have_account': 'ليس لديك حساب؟',
      'already_have_account': 'لديك حساب بالفعل؟',
      'email_too_long': 'البريد الإلكتروني طويل جداً',
      'password_too_long': 'كلمة المرور طويلة جداً',
      'invalid_email_or_password': 'البريد الإلكتروني أو كلمة المرور غير صحيحة',
      'enter_email_first': 'الرجاء إدخال عنوان بريدك الإلكتروني أولاً',
      'reset_link_sent': 'رابط إعادة تعيين كلمة المرور أرسل إلى بريدك الإلكتروني',
      'reset_link_will_sent': 'سيتم إرسال رابط الإعادة إلى',
      'forgot_password_title': 'نسيت كلمة المرور',
      'error_title': 'خطأ',
      'success_title': 'نجاح',
      'login_successful': 'تم تسجيل الدخول بنجاح!',
      'login_failed': 'فشل تسجيل الدخول',
      'info_title': 'معلومات',
      'signup_coming_soon': 'وظيفة إنشاء الحساب ستصبح قادرة على العمل قريباً',
      'send_reset_link': 'إرسال رابط إعادة التعيين',
      'current_language': 'اللغة الحالية',
      'or': 'أو',
      'demo_credentials': 'بيانات العرض التوضيحي',
      'demo_credentials_info': 'المسؤول: admin@example.com / password123\nالمستخدم: user@example.com / password123',
      'welcome_user': 'مرحباً بك، المستخدم',
      'app_tagline': 'تطبيق البنية: إنشاء المستقبل، عطاء إطارًا واحدًا في كل مرة',
      'page_not_found': 'الصفحة غير موجودة',
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
    Locale('ar', 'SA'),
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
    return languageCode == 'en_US' || languageCode == 'ar_SA';
  }
  
  void changeLanguage(String languageCode) {
    if (!_isLanguageSupported(languageCode)) {
      languageCode = _defaultLanguage;
    }
    
    Locale newLocale;
    if (languageCode == 'ar_SA') {
      newLocale = const Locale('ar', 'SA');
    } else {
      newLocale = const Locale('en', 'US');
    }
    
    Get.updateLocale(newLocale);
    _storage.write(_storageKey, languageCode);
  }
  
  String getCurrentLanguage() {
    final Locale? currentLocale = Get.locale;
    if (currentLocale != null) {
      if (currentLocale.languageCode == 'ar' && currentLocale.countryCode == 'SA') {
        return 'ar_SA';
      } else if (currentLocale.languageCode == 'en' && currentLocale.countryCode == 'US') {
        return 'en_US';
      }
    }
    return _defaultLanguage;
  }
  
  Locale getCurrentLocale() {
    final Locale? currentLocale = Get.locale;
    if (currentLocale != null) {
      return currentLocale;
    }
    return fallbackLocale;
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
      changeLanguage('ar_SA');
    } else {
      changeLanguage('en_US');
    }
  }


  String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en_US':
        return 'English';
      case 'ar_SA':
        return 'العربية';
      default:
        return 'English';
    }
  }


  String getLanguageNativeName(String languageCode) {
    switch (languageCode) {
      case 'en_US':
        return 'English';
      case 'ar_SA':
        return 'العربية';
      default:
        return 'English';

    }
  }
  
  String getCurrentLanguageDisplayName() {
    final String currentLanguage = getCurrentLanguage();
    return getLanguageName(currentLanguage);
  }
  
  String getCurrentLanguageNativeName() {
    final String currentLanguage = getCurrentLanguage();
    return getLanguageNativeName(currentLanguage);
  }
}
