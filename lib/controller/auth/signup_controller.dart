import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/class/my_class.dart';
import 'package:trendify_app/core/class/status_request.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_link_api.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/core/functions/handling_data.dart';
import 'package:trendify_app/core/functions/is_same_password.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';

import '../../core/services/app_services.dart';
import '../../utils/popups/full_screen_loader.dart';

abstract class SignupController extends GetxController {
  toggleObscureText();
  goToLogin();
  signUp();
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
  MyClass myClass = Get.find<MyClass>();
  AppServices? appServices = Get.find<AppServices>();
  late StatusRequest statusRequest;

  @override
  void toggleObscureText() {
    obscureText = !obscureText!;
    update();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.init;
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
  Future<void> signUp() async {
    if (!formState.currentState!.validate()) {
      return;
    }
    if (!isSamePassword(password!.text, confirmPassword!.text)) {
      AppHelperFunctions.warningSnackBar(
        title: "Password Mismatch",
        message: "Please make sure both password fields are identical.",
      );
      return;
    }
    try {
      statusRequest = StatusRequest.loading;
      AppFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        AppImages.docerAnimation,
      );
      update();
      final body = {
        "firstName": firsName!.text.trim(),
        "lastName": lastName!.text.trim(),
        "email": email!.text.trim(),
        "phone": phone!.text.trim(),
        "password": password!.text,
        "passwordConfirm": confirmPassword!.text,
        "role": "user",
      };
      final response = await myClass.postData(AppLinkApi.signUp, body);
      statusRequest = handlingData(response);
      AppFullScreenLoader.stopLoading();
      if (statusRequest == StatusRequest.success) {
        await appServices!.sharedPref.setBool("signedUp", true);
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
        Get.offAllNamed(
          AppRoutes.verifyEmail,
          arguments: {"email": email!.text.trim()},
        );
      } else {
        AppHelperFunctions.warningSnackBar(
          title: "Oops!",
          message: "E-mail or phone number already in use.",
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
