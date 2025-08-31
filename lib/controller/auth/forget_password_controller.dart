import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_images.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/constant/app_routes.dart';
import '../../core/functions/handling_data.dart';
import '../../utils/helpers/function_helpers.dart';
import '../../utils/popups/full_screen_loader.dart';

abstract class ForgetPasswordController extends GetxController {
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController? email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;

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
  goToVerifyCode() async {
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
      final response = await myClass.postData(AppLinkApi.forgetPassword, {
        "email": email!.text,
      });
      statusRequest = handlingData(response);
      AppFullScreenLoader.stopLoading();
      if (statusRequest == StatusRequest.success) {
        Get.offAllNamed(
          AppRoutes.verifyCodePassword,
          arguments: {"email": email!.text},
        );
      } else {
        if (statusRequest == StatusRequest.failure) {
          AppHelperFunctions.warningSnackBar(
            title: "Oops!",
            message: "There is no user with that email ${email!.text}",
          );
        }
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
