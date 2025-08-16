import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController fadeController;
  late AnimationController scaleController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();

    // Fade Animation
    fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: fadeController, curve: Curves.easeInOut),
    );

    // Scale Animation
    scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.elasticOut),
    );

    // Start Animations
    fadeController.forward();
    scaleController.forward();

    // Navigate after delay
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed('/home');
  }

  @override
  void onClose() {
    fadeController.dispose();
    scaleController.dispose();
    super.onClose();
  }
}
