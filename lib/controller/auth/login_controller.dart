import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_images.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/app_services.dart';
import '../../utils/helpers/function_helpers.dart';
import '../../utils/popups/full_screen_loader.dart';

abstract class LoginController extends GetxController {
  toggleObscureText();
  onLogin();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyClass myClass = Get.find<MyClass>();
  late StatusRequest statusRequest;
  late TextEditingController? email;
  late TextEditingController? password;
  AppServices? appServices = Get.put(AppServices());
  bool? obscureText = true;
  bool isLoggedIn = false;

  @override
  void toggleObscureText() {
    obscureText = !obscureText!;
    update();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.init;
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
  onLogin() async {
    if (!formState.currentState!.validate()) {
      return;
    }
    try {
      statusRequest = StatusRequest.loading;
      AppFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        AppImages.docerAnimation,
      );
      update();
      final response = await myClass.postData(AppLinkApi.logIn, {
        "email": email!.text.trim(),
        "password": password!.text,
      });
      statusRequest = handlingData(response);
      AppFullScreenLoader.stopLoading();
      if (statusRequest == StatusRequest.success &&
          response['data']?['role'] == "user") {
        isLoggedIn = true;
        await appServices!.sharedPref.setBool("isLoggedIn", isLoggedIn);
        await appServices!.sharedPref.setString("token", response['token']);
        await appServices!.sharedPref.setString(
          "userId",
          response['data']['_id'],
        );
        await appServices!.sharedPref.setString(
          "firstName",
          response['data']['firstName'],
        );
        await appServices!.sharedPref.setString(
          "lastName",
          response['data']['lastName'],
        );
        await appServices!.sharedPref.setString(
          "email",
          response['data']['email'],
        );
        Get.offAllNamed(AppRoutes.navigationMenu);
      } else {
        AppHelperFunctions.warningSnackBar(
          title: "Oops!",
          message: "E-mail or password incorrect.",
        );
      }
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
    }
  }
}
