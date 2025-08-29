import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/class/my_class.dart';
import 'package:trendify_app/core/class/status_request.dart';
import 'package:trendify_app/core/constant/app_link_api.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/core/functions/handling_data.dart';
import 'package:trendify_app/core/functions/is_same_password.dart';
import 'package:trendify_app/helpers/function_helpers.dart';

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
  late StatusRequest statusRequest;

  @override
  void toggleObscureText() {
    obscureText = !obscureText!;
    update();
  }

  @override
  void onInit() {
    statusRequest=StatusRequest.init;
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
    final body = {
      "firstName": firsName!.text,
      "lastName": lastName!.text,
      "email": email!.text,
      "phone": phone!.text,
      "password": password!.text,
      "passwordConfirm": confirmPassword!.text,
      "role": "user",
    };
    final response = await myClass.postData(AppLinkApi.signUp, body);
    statusRequest = handlingData(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      Get.offAllNamed(AppRoutes.verifyEmail, arguments: {"email": email});
    } else if (statusRequest == StatusRequest.failure) {
      AppHelperFunctions.warningSnackBar(
        title: "Oops!",
        message: "E-mail or phone number already in use.",
      );
    }
  } catch (e) {
    AppHelperFunctions.errorSnackBar(
      title: "Error",
      message: "Something went wrong. Please try again later.",
    );
  }
}

}
