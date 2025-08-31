import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_images.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/functions/handling_data.dart';
import '../../core/functions/is_same_password.dart';
import '../../utils/helpers/function_helpers.dart';
import '../../utils/popups/full_screen_loader.dart';

abstract class UpdatePasswordController extends GetxController {
  toggleObscureText();
  goToHome();
}

class UpdatePasswordControllerImp extends UpdatePasswordController {
  late TextEditingController? password;
  late TextEditingController? confirmPassword;
  late String email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool? obscureText = true;
  MyClass myClass = Get.find<MyClass>();
  late StatusRequest statusRequest;

  @override
  void toggleObscureText() {
    obscureText = !obscureText!;
    update();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.init;
    email = Get.arguments["email"];
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password!.dispose();
    confirmPassword!.dispose();
    super.dispose();
  }

  @override
  goToHome() async {
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
      final response = await myClass.postData(AppLinkApi.resetPassword, {
        "email": email,
        "newPassword": password!.text,
        "passwordConfirm": confirmPassword!.text,
      });
      statusRequest = handlingData(response);
      AppFullScreenLoader.stopLoading();
      if (statusRequest == StatusRequest.success) {
        Get.offAllNamed(AppRoutes.navigationMenu);
        AppHelperFunctions.successSnackBar(
          title: "Success",
          message: "Your password has been reset successfully.",
          duration: 3,
        );
      } else {
        AppHelperFunctions.warningSnackBar(
          title: "Oops!",
          message:
              response['message'] ??
              "Unable to reset password. Please try again.",
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
