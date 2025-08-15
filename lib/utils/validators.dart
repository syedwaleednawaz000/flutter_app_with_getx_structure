class Validators {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    
    if (value.length > 100) {
      return 'Email is too long';
    }
    
    // Basic email regex pattern
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    
    return null;
  }
  
  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    
    if (value.length > 50) {
      return 'Password is too long';
    }
    
    // Check for at least one uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    
    // Check for at least one lowercase letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    
    // Check for at least one number
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    
    // Check for at least one special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    
    return null;
  }
  
  // Confirm password validation
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (value != password) {
      return 'Passwords do not match';
    }
    
    return null;
  }
  
  // Username validation
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    
    if (value.length > 20) {
      return 'Username is too long';
    }
    
    // Check for valid characters (alphanumeric and underscore only)
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    
    // Check if username starts with a letter
    if (!RegExp(r'^[a-zA-Z]').hasMatch(value)) {
      return 'Username must start with a letter';
    }
    
    return null;
  }
  
  // Full name validation
  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    
    if (value.length < 2) {
      return 'Full name must be at least 2 characters';
    }
    
    if (value.length > 100) {
      return 'Full name is too long';
    }
    
    // Check for valid characters (letters, spaces, hyphens, apostrophes)
    if (!RegExp(r"^[a-zA-Z\s\-']+$").hasMatch(value)) {
      return 'Full name can only contain letters, spaces, hyphens, and apostrophes';
    }
    
    // Check if name contains at least two words
    final words = value.trim().split(RegExp(r'\s+'));
    if (words.length < 2) {
      return 'Please enter your full name (first and last name)';
    }
    
    return null;
  }
  
  // Phone number validation
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    
    // Remove all non-digit characters
    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');
    
    if (digitsOnly.length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    
    if (digitsOnly.length > 15) {
      return 'Phone number is too long';
    }
    
    // Check for valid phone number patterns
    final phoneRegex = RegExp(
      r'^(\+?1[-.\s]?)?\(?([0-9]{3})\)?[-.\s]?([0-9]{3})[-.\s]?([0-9]{4})$',
    );
    
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    
    return null;
  }
  
  // Address validation
  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    
    if (value.length < 10) {
      return 'Address must be at least 10 characters';
    }
    
    if (value.length > 200) {
      return 'Address is too long';
    }
    
    return null;
  }
  
  // City validation
  static String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'City is required';
    }
    
    if (value.length < 2) {
      return 'City must be at least 2 characters';
    }
    
    if (value.length > 50) {
      return 'City is too long';
    }
    
    // Check for valid characters (letters, spaces, hyphens)
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(value)) {
      return 'City can only contain letters, spaces, and hyphens';
    }
    
    return null;
  }
  
  // Country validation
  static String? validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Country is required';
    }
    
    if (value.length < 2) {
      return 'Country must be at least 2 characters';
    }
    
    if (value.length > 50) {
      return 'Country is too long';
    }
    
    // Check for valid characters (letters, spaces, hyphens)
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(value)) {
      return 'Country can only contain letters, spaces, and hyphens';
    }
    
    return null;
  }
  
  // ZIP code validation
  static String? validateZipCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'ZIP code is required';
    }
    
    if (value.length < 5) {
      return 'ZIP code must be at least 5 characters';
    }
    
    if (value.length > 10) {
      return 'ZIP code is too long';
    }
    
    // Check for valid ZIP code patterns (US format)
    final zipRegex = RegExp(r'^\d{5}(-\d{4})?$');
    
    if (!zipRegex.hasMatch(value)) {
      return 'Please enter a valid ZIP code';
    }
    
    return null;
  }
  
  // Required field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
  
  // Minimum length validation
  static String? validateMinLength(String? value, int minLength, String fieldName) {
    if (value == null || value.length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }
    return null;
  }
  
  // Maximum length validation
  static String? validateMaxLength(String? value, int maxLength, String fieldName) {
    if (value != null && value.length > maxLength) {
      return '$fieldName must be no more than $maxLength characters';
    }
    return null;
  }
  
  // URL validation
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }
    
    try {
      final uri = Uri.parse(value);
      if (!uri.hasScheme || !uri.hasAuthority) {
        return 'Please enter a valid URL';
      }
    } catch (e) {
      return 'Please enter a valid URL';
    }
    
    return null;
  }
  
  // Date validation
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date is required';
    }
    
    try {
      DateTime.parse(value);
    } catch (e) {
      return 'Please enter a valid date';
    }
    
    return null;
  }
  
  // Age validation
  static String? validateAge(int? age, {int minAge = 13, int maxAge = 120}) {
    if (age == null) {
      return 'Age is required';
    }
    
    if (age < minAge) {
      return 'Age must be at least $minAge years';
    }
    
    if (age > maxAge) {
      return 'Age must be no more than $maxAge years';
    }
    
    return null;
  }
  
  // Credit card validation (Luhn algorithm)
  static String? validateCreditCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'Credit card number is required';
    }
    
    // Remove spaces and dashes
    final cleanNumber = value.replaceAll(RegExp(r'[\s\-]'), '');
    
    if (cleanNumber.length < 13 || cleanNumber.length > 19) {
      return 'Credit card number must be between 13 and 19 digits';
    }
    
    // Luhn algorithm validation
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
    
    if (sum % 10 != 0) {
      return 'Invalid credit card number';
    }
    
    return null;
  }
  
  // Social Security Number validation (US format)
  static String? validateSSN(String? value) {
    if (value == null || value.isEmpty) {
      return 'Social Security Number is required';
    }
    
    // Remove dashes and spaces
    final cleanSSN = value.replaceAll(RegExp(r'[\s\-]'), '');
    
    if (cleanSSN.length != 9) {
      return 'Social Security Number must be 9 digits';
    }
    
    // Check if all characters are digits
    if (!RegExp(r'^\d{9}$').hasMatch(cleanSSN)) {
      return 'Social Security Number can only contain digits';
    }
    
    // Check for invalid patterns
    if (cleanSSN == '000000000' || 
        cleanSSN == '111111111' || 
        cleanSSN == '123456789') {
      return 'Invalid Social Security Number';
    }
    
    return null;
  }
  
  // Numeric validation
  static String? validateNumeric(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return '$fieldName must contain only numbers';
    }
    
    return null;
  }
  
  // Decimal validation
  static String? validateDecimal(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (!RegExp(r'^\d*\.?\d+$').hasMatch(value)) {
      return '$fieldName must be a valid decimal number';
    }
    
    return null;
  }
  
  // Alpha validation (letters only)
  static String? validateAlpha(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return '$fieldName can only contain letters and spaces';
    }
    
    return null;
  }
  
  // Alphanumeric validation
  static String? validateAlphanumeric(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (!RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(value)) {
      return '$fieldName can only contain letters, numbers, and spaces';
    }
    
    return null;
  }
}
