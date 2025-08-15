import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helpers {
  // Format currency
  static String formatCurrency(double amount, {String currency = 'USD'}) {
    final formatter = NumberFormat.currency(
      symbol: currency == 'USD' ? '\$' : currency,
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }
  
  // Format number with commas
  static String formatNumber(num number) {
    final formatter = NumberFormat('#,###.##');
    return formatter.format(number);
  }
  
  // Format percentage
  static String formatPercentage(double value, {int decimalPlaces = 2}) {
    final formatter = NumberFormat.percentPattern();
    formatter.minimumFractionDigits = decimalPlaces;
    formatter.maximumFractionDigits = decimalPlaces;
    return formatter.format(value / 100);
  }
  
  // Format date
  static String formatDate(DateTime date, {String pattern = 'MMM dd, yyyy'}) {
    final formatter = DateFormat(pattern);
    return formatter.format(date);
  }
  
  // Format time
  static String formatTime(DateTime time, {String pattern = 'hh:mm a'}) {
    final formatter = DateFormat(pattern);
    return formatter.format(time);
  }
  
  // Format date and time
  static String formatDateTime(DateTime dateTime, {String pattern = 'MMM dd, yyyy hh:mm a'}) {
    final formatter = DateFormat(pattern);
    return formatter.format(dateTime);
  }
  
  // Get relative time (e.g., "2 hours ago")
  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }
  
  // Get file size in human readable format
  static String getFileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
    }
  }
  
  // Get initials from name
  static String getInitials(String name) {
    if (name.isEmpty) return '';
    
    final names = name.trim().split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    } else if (names.length == 1) {
      return names[0][0].toUpperCase();
    }
    return '';
  }
  
  // Capitalize first letter of each word
  static String capitalizeWords(String text) {
    if (text.isEmpty) return text;
    
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    }).join(' ');
  }
  
  // Truncate text with ellipsis
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }
  
  // Generate random string
  static String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = DateTime.now().millisecondsSinceEpoch;
    final buffer = StringBuffer();
    
    for (int i = 0; i < length; i++) {
      buffer.write(chars[random % chars.length]);
    }
    
    return buffer.toString();
  }
  
  // Generate random number
  static int generateRandomNumber(int min, int max) {
    final random = DateTime.now().millisecondsSinceEpoch;
    return min + (random % (max - min + 1));
  }
  
  // Check if string is numeric
  static bool isNumeric(String? value) {
    if (value == null || value.isEmpty) return false;
    return double.tryParse(value) != null;
  }
  
  // Check if string is email
  static bool isEmail(String? value) {
    if (value == null || value.isEmpty) return false;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }
  
  // Check if string is URL
  static bool isUrl(String? value) {
    if (value == null || value.isEmpty) return false;
    try {
      final uri = Uri.parse(value);
      return uri.hasScheme && uri.hasAuthority;
    } catch (e) {
      return false;
    }
  }
  
  // Check if string is phone number
  static bool isPhoneNumber(String? value) {
    if (value == null || value.isEmpty) return false;
    final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]+$');
    return phoneRegex.hasMatch(value);
  }
  
  // Check if string is credit card number
  static bool isCreditCardNumber(String? value) {
    if (value == null || value.isEmpty) return false;
    final cleanNumber = value.replaceAll(RegExp(r'[\s\-]'), '');
    return cleanNumber.length >= 13 && cleanNumber.length <= 19;
  }
  
  // Validate credit card using Luhn algorithm
  static bool isValidCreditCard(String cardNumber) {
    final cleanNumber = cardNumber.replaceAll(RegExp(r'[\s\-]'), '');
    
    if (cleanNumber.length < 13 || cleanNumber.length > 19) {
      return false;
    }
    
    int sum = 0;
    bool isEven = false;
    
    for (int i = cleanNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cleanNumber[i]);
      
      if (isEven) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      
      sum += digit;
      isEven = !isEven;
    }
    
    return sum % 10 == 0;
  }
  
  // Get age from birth date
  static int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    
    if (now.month < birthDate.month || 
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    
    return age;
  }
  
  // Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && 
           date.month == now.month && 
           date.day == now.day;
  }
  
  // Check if date is yesterday
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year && 
           date.month == yesterday.month && 
           date.day == yesterday.day;
  }
  
  // Check if date is this week
  static bool isThisWeek(DateTime date) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    
    return date.isAfter(startOfWeek.subtract(const Duration(days: 1))) && 
           date.isBefore(endOfWeek.add(const Duration(days: 1)));
  }
  
  // Check if date is this month
  static bool isThisMonth(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month;
  }
  
  // Check if date is this year
  static bool isThisYear(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year;
  }
  
  // Get start of day
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
  
  // Get end of day
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }
  
  // Get start of week
  static DateTime startOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }
  
  // Get end of week
  static DateTime endOfWeek(DateTime date) {
    return startOfWeek(date).add(const Duration(days: 6));
  }
  
  // Get start of month
  static DateTime startOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }
  
  // Get end of month
  static DateTime endOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
  }
  
  // Get start of year
  static DateTime startOfYear(DateTime date) {
    return DateTime(date.year, 1, 1);
  }
  
  // Get end of year
  static DateTime endOfYear(DateTime date) {
    return DateTime(date.year, 12, 31);
  }
  
  // Add days to date
  static DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }
  
  // Subtract days from date
  static DateTime subtractDays(DateTime date, int days) {
    return date.subtract(Duration(days: days));
  }
  
  // Add months to date
  static DateTime addMonths(DateTime date, int months) {
    return DateTime(date.year, date.month + months, date.day);
  }
  
  // Subtract months from date
  static DateTime subtractMonths(DateTime date, int months) {
    return DateTime(date.year, date.month - months, date.day);
  }
  
  // Add years to date
  static DateTime addYears(DateTime date, int years) {
    return DateTime(date.year + years, date.month, date.day);
  }
  
  // Subtract years from date
  static DateTime subtractYears(DateTime date, int years) {
    return DateTime(date.year - years, date.month, date.day);
  }
  
  // Get days between two dates
  static int daysBetween(DateTime from, DateTime to) {
    return to.difference(from).inDays;
  }
  
  // Get months between two dates
  static int monthsBetween(DateTime from, DateTime to) {
    return (to.year - from.year) * 12 + to.month - from.month;
  }
  
  // Get years between two dates
  static int yearsBetween(DateTime from, DateTime to) {
    return to.year - from.year;
  }
  
  // Check if string contains only letters
  static bool isAlpha(String? value) {
    if (value == null || value.isEmpty) return false;
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(value);
  }
  
  // Check if string contains only letters and numbers
  static bool isAlphanumeric(String? value) {
    if (value == null || value.isEmpty) return false;
    return RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(value);
  }
  
  // Check if string contains only numbers
  static bool isNumericOnly(String? value) {
    if (value == null || value.isEmpty) return false;
    return RegExp(r'^[0-9]+$').hasMatch(value);
  }
  
  // Check if string contains only lowercase letters
  static bool isLowercase(String? value) {
    if (value == null || value.isEmpty) return false;
    return value == value.toLowerCase();
  }
  
  // Check if string contains only uppercase letters
  static bool isUppercase(String? value) {
    if (value == null || value.isEmpty) return false;
    return value == value.toUpperCase();
  }
  
  // Convert string to title case
  static String toTitleCase(String text) {
    if (text.isEmpty) return text;
    
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    }).join(' ');
  }
  
  // Convert string to sentence case
  static String toSentenceCase(String text) {
    if (text.isEmpty) return text;
    
    return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
  }
  
  // Remove extra spaces from string
  static String removeExtraSpaces(String text) {
    return text.replaceAll(RegExp(r'\s+'), ' ').trim();
  }
  
  // Remove special characters from string
  static String removeSpecialCharacters(String text) {
    return text.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
  }
  
  // Remove numbers from string
  static String removeNumbers(String text) {
    return text.replaceAll(RegExp(r'[0-9]'), '');
  }
  
  // Remove letters from string
  static String removeLetters(String text) {
    return text.replaceAll(RegExp(r'[a-zA-Z]'), '');
  }
  
  // Count words in string
  static int countWords(String text) {
    if (text.isEmpty) return 0;
    return text.trim().split(RegExp(r'\s+')).length;
  }
  
  // Count characters in string (excluding spaces)
  static int countCharacters(String text) {
    return text.replaceAll(RegExp(r'\s'), '').length;
  }
  
  // Count lines in string
  static int countLines(String text) {
    if (text.isEmpty) return 0;
    return text.split('\n').length;
  }
  
  // Reverse string
  static String reverseString(String text) {
    return String.fromCharCodes(text.codeUnits.reversed);
  }
  
  // Check if string is palindrome
  static bool isPalindrome(String text) {
    final cleanText = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return cleanText == reverseString(cleanText);
  }
  
  // Get first word from string
  static String getFirstWord(String text) {
    if (text.isEmpty) return '';
    return text.trim().split(RegExp(r'\s+')).first;
  }
  
  // Get last word from string
  static String getLastWord(String text) {
    if (text.isEmpty) return '';
    final words = text.trim().split(RegExp(r'\s+'));
    return words.last;
  }
  
  // Get word at index from string
  static String getWordAt(String text, int index) {
    if (text.isEmpty || index < 0) return '';
    final words = text.trim().split(RegExp(r'\s+'));
    if (index >= words.length) return '';
    return words[index];
  }
  
  // Insert word at index in string
  static String insertWordAt(String text, String word, int index) {
    if (text.isEmpty) return word;
    final words = text.trim().split(RegExp(r'\s+'));
    if (index < 0 || index > words.length) return text;
    
    words.insert(index, word);
    return words.join(' ');
  }
  
  // Replace word at index in string
  static String replaceWordAt(String text, String newWord, int index) {
    if (text.isEmpty || index < 0) return text;
    final words = text.trim().split(RegExp(r'\s+'));
    if (index >= words.length) return text;
    
    words[index] = newWord;
    return words.join(' ');
  }
  
  // Remove word at index from string
  static String removeWordAt(String text, int index) {
    if (text.isEmpty || index < 0) return text;
    final words = text.trim().split(RegExp(r'\s+'));
    if (index >= words.length) return text;
    
    words.removeAt(index);
    return words.join(' ');
  }
}
