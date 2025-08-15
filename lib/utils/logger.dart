import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  // Info level logging
  static void info(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  // Debug level logging
  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  // Warning level logging
  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  // Error level logging
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  // Fatal level logging
  static void fatal(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }

  // Verbose level logging
  static void verbose(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.v(message, error: error, stackTrace: stackTrace);
  }

  // Log API requests
  static void logApiRequest(String method, String url, {dynamic body, Map<String, String>? headers}) {
    _logger.i('🌐 API Request: $method $url', error: {
      'body': body,
      'headers': headers,
    });
  }

  // Log API responses
  static void logApiResponse(String method, String url, int statusCode, {dynamic body}) {
    final emoji = statusCode >= 200 && statusCode < 300 ? '✅' : '❌';
    _logger.i('$emoji API Response: $method $url ($statusCode)', error: {
      'body': body,
    });
  }

  // Log API errors
  static void logApiError(String method, String url, dynamic error) {
    _logger.e('❌ API Error: $method $url', error: error);
  }

  // Log user actions
  static void logUserAction(String action, {Map<String, dynamic>? data}) {
    _logger.i('👤 User Action: $action', error: data);
  }

  // Log navigation
  static void logNavigation(String from, String to, {Map<String, dynamic>? data}) {
    _logger.i('🧭 Navigation: $from → $to', error: data);
  }

  // Log state changes
  static void logStateChange(String stateName, dynamic oldValue, dynamic newValue) {
    _logger.d('🔄 State Change: $stateName', error: {
      'old': oldValue,
      'new': newValue,
    });
  }

  // Log performance
  static void logPerformance(String operation, Duration duration) {
    _logger.i('⚡ Performance: $operation took ${duration.inMilliseconds}ms');
  }

  // Log memory usage
  static void logMemoryUsage(String context, {int? bytes}) {
    if (bytes != null) {
      final mb = bytes / (1024 * 1024);
      _logger.i('💾 Memory Usage: $context - ${mb.toStringAsFixed(2)} MB');
    } else {
      _logger.i('💾 Memory Usage: $context');
    }
  }

  // Log network status
  static void logNetworkStatus(bool isConnected, String connectionType) {
    final emoji = isConnected ? '📶' : '❌';
    _logger.i('$emoji Network: ${isConnected ? 'Connected' : 'Disconnected'} ($connectionType)');
  }

  // Log file operations
  static void logFileOperation(String operation, String filePath, {bool success = true}) {
    final emoji = success ? '📁' : '❌';
    _logger.i('$emoji File Operation: $operation - $filePath');
  }

  // Log database operations
  static void logDatabaseOperation(String operation, String table, {bool success = true}) {
    final emoji = success ? '🗄️' : '❌';
    _logger.i('$emoji Database: $operation on $table');
  }

  // Log authentication
  static void logAuthentication(String action, {bool success = true, String? userId}) {
    final emoji = success ? '🔐' : '❌';
    _logger.i('$emoji Authentication: $action${userId != null ? ' - User: $userId' : ''}');
  }

  // Log validation
  static void logValidation(String field, String value, {bool isValid = true, String? error}) {
    final emoji = isValid ? '✅' : '❌';
    _logger.d('$emoji Validation: $field = "$value"${error != null ? ' - Error: $error' : ''}');
  }

  // Log cache operations
  static void logCacheOperation(String operation, String key, {bool success = true}) {
    final emoji = success ? '💾' : '❌';
    _logger.d('$emoji Cache: $operation - $key');
  }

  // Log theme changes
  static void logThemeChange(String oldTheme, String newTheme) {
    _logger.i('🎨 Theme Change: $oldTheme → $newTheme');
  }

  // Log language changes
  static void logLanguageChange(String oldLanguage, String newLanguage) {
    _logger.i('🌍 Language Change: $oldLanguage → $newLanguage');
  }

  // Log app lifecycle
  static void logAppLifecycle(String state) {
    _logger.i('📱 App Lifecycle: $state');
  }

  // Log errors with context
  static void logErrorWithContext(String context, dynamic error, StackTrace? stackTrace) {
    _logger.e('❌ Error in $context', error: error, stackTrace: stackTrace);
  }

  // Log warnings with context
  static void logWarningWithContext(String context, String message) {
    _logger.w('⚠️ Warning in $context: $message');
  }

  // Log info with context
  static void logInfoWithContext(String context, String message) {
    _logger.i('ℹ️ Info in $context: $message');
  }

  // Log debug with context
  static void logDebugWithContext(String context, String message) {
    _logger.d('🔍 Debug in $context: $message');
  }

  // Conditional logging based on build mode
  static void conditionalLog(String message, {bool debugOnly = true}) {
    if (debugOnly) {
      // Only log in debug mode
      _logger.d(message);
    } else {
      // Log in all modes
      _logger.i(message);
    }
  }

  // Log with custom level
  static void log(Level level, String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(level, message, error: error, stackTrace: stackTrace);
  }

  // Get logger instance for advanced usage
  static Logger get logger => _logger;
}
