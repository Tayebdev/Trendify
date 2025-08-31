import 'dart:async';

import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_images.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/functions/handling_data.dart';
import '../../utils/helpers/function_helpers.dart';
import '../../utils/popups/full_screen_loader.dart';

abstract class VerifyCodePasswordController extends GetxController {
  goToUpdatePassword();
  goToForgetPassword();
  startTimer();
}

class VerifyCodePasswordControllerImp extends VerifyCodePasswordController {
  String? verifyCode;
  late String email;
  RxInt remainingSeconds = 600.obs;
  Timer? _timer;
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;
  @override
  goToUpdatePassword()async {
    startTimer();
    if (verifyCode == null || verifyCode!.isEmpty) {
      AppHelperFunctions.warningSnackBar(
        title: "Missing Code",
        message: "Please enter the verification code before proceeding.",
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
      final response = await myClass.postData(AppLinkApi.verifyPasswordResetCode, {
        "passwordResetCode": verifyCode,
      });
      statusRequest = handlingData(response);
      AppFullScreenLoader.stopLoading();
      if (statusRequest == StatusRequest.success) {
        Get.offAllNamed(AppRoutes.updatePassword);
      } else {
        AppHelperFunctions.warningSnackBar(
          title: "Invalid Code",
          message:
              "The verification code you entered is incorrect. Please try again.",
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

  @override
  void startTimer() {
    _timer?.cancel();
    remainingSeconds.value = 600;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onInit() {
    email=Get.arguments['email'];
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
  
  @override
  goToForgetPassword() {
    Get.offAllNamed(AppRoutes.forgetPassword);
  }
}
