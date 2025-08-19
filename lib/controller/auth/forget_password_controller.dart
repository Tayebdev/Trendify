import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class ForgetPasswordController extends GetxController {
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController? email;
  GlobalKey<FormState> formState=GlobalKey<FormState>();

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    super.dispose();
  }
  
  @override
  goToVerifyCode() {
    if (formState.currentState!.validate()) {
      Get.offAllNamed(AppRoutes.verifyCode);
    }
    
  }
}
