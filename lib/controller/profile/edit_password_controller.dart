import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_images.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/constant/app_routes.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/app_services.dart';
import '../../utils/helpers/function_helpers.dart';
import '../../utils/popups/full_screen_loader.dart';

abstract class EditPasswordController extends GetxController {
  void toggleObscureText();
  void editPassword();
}

class EditPasswordControllerImp extends EditPasswordController {
  late String userId;
  StatusRequest statusRequest = StatusRequest.init;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController currentPassword;

  AppServices appServices = Get.find<AppServices>();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyClass myClass = Get.find<MyClass>();
  bool obscureText = true;

  @override
  void toggleObscureText() {
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    userId = appServices.sharedPref.getString('userId').toString();
    password = TextEditingController();
    currentPassword = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    currentPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  void editPassword() async {
    if (!formState.currentState!.validate()) return;
    try {
      statusRequest = StatusRequest.loading;
      AppFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        AppImages.docerAnimation,
      );
      update();
      final response = await myClass
          .putData("${AppLinkApi.editPassword}/$userId", {
            "password": password.text.trim(),
            "confirmPassword": confirmPassword.text.trim(),
            "currentPassword": currentPassword.text.trim(),
          });
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success' && response['data'] != null) {
          AppFullScreenLoader.stopLoading();
          AppHelperFunctions.successSnackBar(
            title: "Success",
            message: "Profile updated successfully",
            duration: 3,
          );
          Get.offAllNamed(AppRoutes.navigationMenu);
        }
      } else if (statusRequest == StatusRequest.failure) {
        AppFullScreenLoader.stopLoading();
        AppHelperFunctions.warningSnackBar(
          title: "Oops!",
          message:
              "The current password is incorrect or the password confirmation does not match.",
        );
      }
      update();
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      AppFullScreenLoader.stopLoading();
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
      update();
    }
  }
}
