import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/class/status_request.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import '../../utils/helpers/function_helpers.dart';

abstract class VerifyEmailController extends GetxController {
  void goToLogin();
  void goToVerifyCode();
}

class VerifyEmailControllerImp extends VerifyEmailController {
  String? email;
  late StatusRequest statusRequest;
  @override
  goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  @override
  goToVerifyCode() {
    Get.offAllNamed(AppRoutes.verifyCodeEmail,arguments: {"email":email});
  }

  @override
  void onInit() {
    statusRequest=StatusRequest.init;
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppHelperFunctions.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue',
      );
    });
  }
}
