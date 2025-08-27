import 'package:flutter/material.dart';
import 'package:get/get.dart';

// GetX Controller
class AppLoadingController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController fadeController;
  late AnimationController scaleController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();

    fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    fadeAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeInOut,
    ));

    scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: scaleController,
      curve: Curves.easeInOut,
    ));

    fadeController.repeat(reverse: true);
    scaleController.repeat(reverse: true);
  }

  @override
  void onClose() {
    fadeController.dispose();
    scaleController.dispose();
    super.onClose();
  }
}