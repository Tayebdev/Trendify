import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

import '../core/services/app_services.dart';

abstract class SettingController extends GetxController {
  void goToProfile();
  void toggleTheme(bool value);
  void goToAddressUser();
  void goToCart();
}

class SettingControllerImp extends SettingController {
  AppServices appServices = Get.find<AppServices>();
  late String firstName;
  late String lastName;
  late String email;
  RxBool isDarkMode = true.obs;
  static SettingControllerImp get instance => Get.find();

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
  @override
  void onInit() {
    email = appServices.sharedPref.getString('email').toString();
    firstName = appServices.sharedPref.getString('firstName').toString();
    lastName = appServices.sharedPref.getString('lastName').toString();
    super.onInit();
  }
}
