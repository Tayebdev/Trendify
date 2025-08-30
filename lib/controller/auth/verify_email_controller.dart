import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import '../../helpers/function_helpers.dart';

abstract class VerifyEmailController extends GetxController {
  goToLogin();
  goToVerifyCode();
}

class VerifyEmailControllerImp extends VerifyEmailController {
  @override
  goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  @override
  goToVerifyCode() {
    Get.toNamed(AppRoutes.verifyCodeEmail);
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppHelperFunctions.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue',
      );
    });
  }
}
