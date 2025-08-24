import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class SignupController extends GetxController {
  toggleObscureText();
  goToLogin();
  goToVerifyEmail();
}

class SignupControllerImp extends SignupController {
  late TextEditingController? email;
  late TextEditingController? password;
  late TextEditingController? lastName;
  late TextEditingController? firsName;
  late TextEditingController? confirmPassword;
  late TextEditingController? phone;
  static SignupControllerImp get instance => Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
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
    lastName = TextEditingController();
    firsName = TextEditingController();
    confirmPassword = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    lastName!.dispose();
    firsName!.dispose();
    confirmPassword!.dispose();
    phone!.dispose();
    super.dispose();
  }

  @override
  goToLogin() {
    Get.toNamed(AppRoutes.login);

  }

  @override
  goToVerifyEmail() {
    if (formState.currentState!.validate()) {
      Get.offAllNamed(AppRoutes.verifyEmail);
    } else {
      print('not validate');
    }
  }
}
