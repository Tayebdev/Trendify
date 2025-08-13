import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class SettingController extends GetxController {
  goToProfile();
  toggleTheme(bool value);
}

class SettingControllerImp extends SettingController {
  var isDarkMode = true.obs;

  @override
  goToProfile() {
    Get.toNamed(AppRoutes.profile);
  }

  @override
  void toggleTheme(value) {
    isDarkMode.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }
}
