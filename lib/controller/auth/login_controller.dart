import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class LoginController extends GetxController {
  toggleObscureText();
  onLogin();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController? email;
  late TextEditingController? password;
  bool? obscureText = true;

  @override
  void toggleObscureText() {
    obscureText = !obscureText!;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    super.dispose();
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  onLogin() {
    if (formState.currentState!.validate()) {
      Get.offAllNamed(AppRoutes.navigationMenu);
      print('validate');
    } else {
      print('Not validate');
    }
  }
}
