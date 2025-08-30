import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class UpdatePasswordController extends GetxController {
  toggleObscureText();
  goToHome();
}

class UpdatePasswordControllerImp extends UpdatePasswordController {
  late TextEditingController? password;
  late TextEditingController? confirmPassword;
  bool? obscureText = true;
  @override
  void toggleObscureText() {
    obscureText = !obscureText!;
    update();
  }

  @override
  void onInit() {
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  goToHome() {
    Get.offAllNamed(AppRoutes.navigationMenu);
  }
}
