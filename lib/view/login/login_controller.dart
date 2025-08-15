import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:structure/config/app_constants.dart';




class LoginController extends GetxController {
  // final UserRepository _userRepository = Get.find<UserRepository>();
  
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
      emailError.value = 'email_required'.tr;
      return 'email_required'.tr;
    }
    
    if (value.length > AppConstants.maxEmailLength) {
      emailError.value = 'email_too_long'.tr;
      return 'email_too_long'.tr;
    }
    
    // Basic email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      emailError.value = 'email_invalid'.tr;
      return 'email_invalid'.tr;
    }
    
    emailError.value = '';
    return null;
  }
  
  // Validate password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      passwordError.value = 'password_required'.tr;
      return 'password_required'.tr;
    }
    
    if (value.length < AppConstants.minPasswordLength) {
      passwordError.value = 'password_min_length'.tr;
      return 'password_min_length'.tr;
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
      emailError.value = '';
      passwordError.value = '';
      await Future.delayed(const Duration(seconds: 2));
      
      // For now, simulate successful login
      final success = await _simulateLogin();
      
      if (success) {
        // Save credentials if remember me is enabled
        saveCredentials();
        
        // Navigate to home page
        Get.offAllNamed('/home');
        
        // Show success message
        Get.snackbar(
          'success_title'.tr,
          'login_successful'.tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        errorMessage.value = 'invalid_credentials'.tr;
      }
      
    } catch (e) {
      errorMessage.value = '${'login_failed'.tr}: $e';
    } finally {
      isLoading.value = false;
    }
  }
  
  // Simulate login (replace with actual API call)
  Future<bool> _simulateLogin() async {
    return true;
  }
  
  // Forgot password
  Future<void> forgotPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar(
        'error_title'.tr,
        'enter_email_first'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }
    
    // TODO: Implement forgot password functionality
    await Get.defaultDialog(
      title: 'forgot_password_title'.tr,
      content: Text('${'reset_link_will_sent'.tr} ${emailController.text}'),
      confirm: TextButton(
        onPressed: () {
          Get.back();
          _sendPasswordResetEmail();
        },
        child: Text('send_reset_link'.tr),
      ),
      cancel: TextButton(
        onPressed: () => Get.back(),
        child: Text('cancel'.tr),
      ),
    );
  }
  
  // Send password reset email
  void _sendPasswordResetEmail() {
    Get.snackbar(
      'success_title'.tr,
      'reset_link_sent'.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
  
  // Sign up
  void signUp() {
    // TODO: Navigate to sign up page
    Get.snackbar(
      'info_title'.tr,
      'signup_coming_soon'.tr,
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
