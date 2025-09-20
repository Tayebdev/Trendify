import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/controller/setting/setting_controller.dart';

import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_images.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/constant/app_routes.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/app_services.dart';
import '../../utils/helpers/function_helpers.dart';
import '../../utils/popups/full_screen_loader.dart';
import 'profile_controller.dart';

abstract class EditPersonalController extends GetxController {
  void saveChangeProfilePersonal();
}

class EditPersonalControllerImp extends EditPersonalController {
  late String userId;
  GlobalKey<FormState> formStateProfile = GlobalKey<FormState>();
  AppServices appServices = Get.find<AppServices>();
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;
  late TextEditingController email;
  late TextEditingController phone;
  @override
  void saveChangeProfilePersonal() async {
    if (!formStateProfile.currentState!.validate()) {
      return;
    }

    try {
      statusRequest = StatusRequest.loading;
      AppFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        AppImages.docerAnimation,
      );
      update();
      var response = await myClass.putData("${AppLinkApi.user}$userId", {
        "email": email.text.trim(),
        "phone": phone.text.trim(),
      });
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success' && response['data'] != null) {
          appServices.sharedPref.setString('email', email.text);
          AppFullScreenLoader.stopLoading();
          AppHelperFunctions.successSnackBar(
            title: "Success",
            message: "Profile updated successfully",
            duration: 3,
          );
          final profileController = Get.find<ProfileControllerImp>();
          profileController.getUser();
          final settingController = Get.find<SettingControllerImp>();
          settingController.onInit();
          Get.offAllNamed(AppRoutes.navigationMenu);
        }
      } else {
        if (statusRequest == StatusRequest.failure) {
          AppFullScreenLoader.stopLoading();
          AppHelperFunctions.warningSnackBar(
            title: "Oops!",
            message: "Email or Phone already in use",
          );
        }
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

  @override
  void onInit() {
    super.onInit();
    userId = appServices.sharedPref.getString('userId').toString();
    email = TextEditingController();
    phone = TextEditingController();

    final arguments = Get.arguments as Map<String, dynamic>;
    email.text = arguments['email'];
    phone.text = arguments['phone'];
  }

  @override
  void dispose() {
    email.dispose();
    phone.dispose();
    super.dispose();
  }
}
