import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class SettingController extends GetxController {
  void goToProfile();
  void toggleTheme(bool value);
  void goToAddressUser();
  void goToCart();
}

class SettingControllerImp extends SettingController {
  RxBool isDarkMode = true.obs;

  @override
  goToProfile() {
    Get.toNamed(AppRoutes.profile);
  }

  @override
  void toggleTheme(value) {
    isDarkMode.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  goToAddressUser() {
    Get.toNamed(AppRoutes.addressUser);
  }

  @override
  goToCart() {
    Get.toNamed(AppRoutes.cart);
  }
}
