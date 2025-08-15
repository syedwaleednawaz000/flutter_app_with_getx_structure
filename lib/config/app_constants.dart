class AppConstants {
  // App Information
  static const String appName = 'Structure App';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';
  
  // API Configuration
  static const String baseUrl = 'https://api.example.com';
  static const String apiVersion = '/v1';
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  
  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  static const String appThemeKey = 'app_theme';
  static const String appLanguageKey = 'app_language';
  static const String firstLaunchKey = 'first_launch';
  
  // Validation Rules
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 50;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 20;
  static const int maxEmailLength = 100;
  static const int maxNameLength = 100;
  static const int maxPhoneLength = 20;
  static const int maxAddressLength = 200;
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);
  
  // Debounce Delay
  static const Duration searchDebounceDelay = Duration(milliseconds: 500);
  static const Duration inputDebounceDelay = Duration(milliseconds: 300);
  
  // Cache Expiration
  static const Duration shortCacheExpiration = Duration(minutes: 5);
  static const Duration mediumCacheExpiration = Duration(minutes: 30);
  static const Duration longCacheExpiration = Duration(hours: 24);
  
  // Error Messages
  static const String genericErrorMessage = 'Something went wrong. Please try again.';
  static const String networkErrorMessage = 'Please check your internet connection.';
  static const String serverErrorMessage = 'Server error. Please try again later.';
  static const String unauthorizedErrorMessage = 'You are not authorized to perform this action.';
  static const String forbiddenErrorMessage = 'Access denied.';
  static const String notFoundErrorMessage = 'The requested resource was not found.';
  static const String validationErrorMessage = 'Please check your input and try again.';
  
  // Success Messages
  static const String genericSuccessMessage = 'Operation completed successfully.';
  static const String saveSuccessMessage = 'Data saved successfully.';
  static const String deleteSuccessMessage = 'Data deleted successfully.';
  static const String updateSuccessMessage = 'Data updated successfully.';
  
  // Loading Messages
  static const String genericLoadingMessage = 'Please wait...';
  static const String savingMessage = 'Saving...';
  static const String loadingMessage = 'Loading...';
  static const String processingMessage = 'Processing...';
  
  // Date Formats
  static const String defaultDateFormat = 'yyyy-MM-dd';
  static const String defaultTimeFormat = 'HH:mm:ss';
  static const String defaultDateTimeFormat = 'yyyy-MM-dd HH:mm:ss';
  static const String displayDateFormat = 'MMM dd, yyyy';
  static const String displayTimeFormat = 'hh:mm a';
  static const String displayDateTimeFormat = 'MMM dd, yyyy hh:mm a';
  
  // Currency
  static const String defaultCurrency = 'USD';
  static const String defaultCurrencySymbol = '\$';
  
  // File Upload
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const int maxDocumentSize = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
  static const List<String> allowedDocumentTypes = ['pdf', 'doc', 'docx', 'txt'];
  
  // Social Media
  static const String facebookUrl = 'https://facebook.com/yourapp';
  static const String twitterUrl = 'https://twitter.com/yourapp';
  static const String instagramUrl = 'https://instagram.com/yourapp';
  static const String linkedinUrl = 'https://linkedin.com/company/yourapp';
  static const String youtubeUrl = 'https://youtube.com/yourapp';
  
  // Support
  static const String supportEmail = 'support@yourapp.com';
  static const String supportPhone = '+1-555-0123';
  static const String supportWebsite = 'https://support.yourapp.com';
  
  // Privacy & Legal
  static const String privacyPolicyUrl = 'https://yourapp.com/privacy';
  static const String termsOfServiceUrl = 'https://yourapp.com/terms';
  static const String cookiePolicyUrl = 'https://yourapp.com/cookies';
}
