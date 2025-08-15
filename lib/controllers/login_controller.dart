import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/user_model.dart';
import '../data/repository/user_repository.dart';
import '../config/app_constants.dart';

class LoginController extends GetxController {
  final UserRepository _userRepository = Get.find<UserRepository>();
  
  // Form controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  // Form validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  // Observable variables
  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxBool rememberMe = false.obs;
  final RxString errorMessage = ''.obs;
  
  // Validation rules
  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Load saved credentials if remember me was enabled
    loadSavedCredentials();
  }
  
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
  
  // Load saved credentials
  void loadSavedCredentials() {
    // TODO: Implement loading saved credentials from secure storage
    // This would typically use GetStorage or SharedPreferences
  }
  
  // Save credentials
  void saveCredentials() {
    if (rememberMe.value) {
      // TODO: Implement saving credentials to secure storage
      // This would typically use GetStorage or SharedPreferences
    }
  }
  
  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  
  // Toggle remember me
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }
  
  // Validate email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      emailError.value = 'Email is required';
      return 'Email is required';
    }
    
    if (value.length > AppConstants.maxEmailLength) {
      emailError.value = 'Email is too long';
      return 'Email is too long';
    }
    
    // Basic email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      emailError.value = 'Please enter a valid email address';
      return 'Please enter a valid email address';
    }
    
    emailError.value = '';
    return null;
  }
  
  // Validate password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      passwordError.value = 'Password is required';
      return 'Password is required';
    }
    
    if (value.length < AppConstants.minPasswordLength) {
      passwordError.value = 'Password must be at least ${AppConstants.minPasswordLength} characters';
      return 'Password must be at least ${AppConstants.minPasswordLength} characters';
    }
    
    if (value.length > AppConstants.maxPasswordLength) {
      passwordError.value = 'Password is too long';
      return 'Password is too long';
    }
    
    passwordError.value = '';
    return null;
  }
  
  // Validate form
  bool validateForm() {
    final emailValid = validateEmail(emailController.text) == null;
    final passwordValid = validatePassword(passwordController.text) == null;
    
    return emailValid && passwordValid;
  }
  
  // Login
  Future<void> login() async {
    if (!validateForm()) {
      return;
    }
    
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      // Clear previous errors
      emailError.value = '';
      passwordError.value = '';
      
      // Simulate API call (replace with actual login logic)
      await Future.delayed(const Duration(seconds: 2));
      
      // TODO: Implement actual login API call
      // final response = await _authRepository.login(
      //   email: emailController.text.trim(),
      //   password: passwordController.text,
      // );
      
      // For now, simulate successful login
      final success = await _simulateLogin();
      
      if (success) {
        // Save credentials if remember me is enabled
        saveCredentials();
        
        // Navigate to home page
        Get.offAllNamed('/home');
        
        // Show success message
        Get.snackbar(
          'Success',
          'Login successful!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        errorMessage.value = 'Invalid email or password';
      }
      
    } catch (e) {
      errorMessage.value = 'Login failed: $e';
    } finally {
      isLoading.value = false;
    }
  }
  
  // Simulate login (replace with actual API call)
  Future<bool> _simulateLogin() async {
    // Simple validation for demo purposes
    final email = emailController.text.trim();
    final password = passwordController.text;
    
    // Demo credentials (replace with actual authentication)
    if (email == 'admin@example.com' && password == 'password123') {
      return true;
    }
    
    if (email == 'user@example.com' && password == 'password123') {
      return true;
    }
    
    return false;
  }
  
  // Forgot password
  Future<void> forgotPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your email address first',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }
    
    // TODO: Implement forgot password functionality
    Get.dialog(
      await Get.defaultDialog(
        title: 'Forgot Password',
        content: Text('Reset link will be sent to ${emailController.text}'),
        confirm: TextButton(
          onPressed: () {
            Get.back();
            Get.snackbar(
              'Success',
              'Password reset link sent to your email',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          },
          child: const Text('Send Reset Link'),
        ),
        cancel: TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
      ),
    );
  }
  
  // Sign up
  void signUp() {
    // TODO: Navigate to sign up page
    Get.snackbar(
      'Info',
      'Sign up functionality coming soon',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }
  
  // Clear form
  void clearForm() {
    emailController.clear();
    passwordController.clear();
    emailError.value = '';
    passwordError.value = '';
    errorMessage.value = '';
    rememberMe.value = false;
  }
  
  // Check if form is valid
  bool get isFormValid {
    return emailController.text.isNotEmpty && 
           passwordController.text.isNotEmpty &&
           emailError.value.isEmpty &&
           passwordError.value.isEmpty;
  }
  
  // Get email text
  String get emailText => emailController.text.trim();
  
  // Get password text
  String get passwordText => passwordController.text;
  
  // Check if email is valid
  bool get isEmailValid => validateEmail(emailText) == null;
  
  // Check if password is valid
  bool get isPasswordValid => validatePassword(passwordText) == null;
}
