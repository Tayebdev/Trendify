import 'package:flutter/widgets.dart';
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
import 'profile_controller.dart';

abstract class EditProfileController extends GetxController {
  void saveChangeProfileInformation();
}

class EditProfileControllerImp extends EditProfileController {
  late String userId;
  GlobalKey<FormState> formStateProfile = GlobalKey<FormState>();
  AppServices appServices = Get.find<AppServices>();
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;
  late TextEditingController firstName;
  late TextEditingController lastName;

  @override
  void saveChangeProfileInformation() async {
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
      var response = await myClass.putData("${AppLinkApi.user}/$userId", {
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
      });
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success' && response['data'] != null) {
          appServices.sharedPref.setString('firstName', firstName.text);
          appServices.sharedPref.setString('lastName', lastName.text);
          AppFullScreenLoader.stopLoading();
          AppHelperFunctions.successSnackBar(
            title: "Success",
            message: "Profile updated successfully",
            duration: 3,
          );
          final profileController = Get.find<ProfileControllerImp>();
          profileController.getUser();
          Get.offAllNamed(AppRoutes.navigationMenu);
        } else {
          AppFullScreenLoader.stopLoading();
          statusRequest = StatusRequest.failure;
          AppHelperFunctions.warningSnackBar(
            title: "Oops!",
            message: "Failed to update profile",
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
    firstName = TextEditingController();
    lastName = TextEditingController();

    final arguments = Get.arguments as Map<String, dynamic>;
    firstName.text = arguments['firstName'];
    lastName.text = arguments['lastName'];
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    super.dispose();
  }
}
