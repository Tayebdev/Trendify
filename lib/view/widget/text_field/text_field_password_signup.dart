import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/controller/auth/signup_controller.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_texts.dart';
import '../../../core/functions/app_validator.dart';


// ignore: must_be_immutable
class AppTextFieldPasswordSignup extends StatelessWidget {
   const AppTextFieldPasswordSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupControllerImp>(
      builder: (controller) => TextFormField(
        controller: controller.password,
        validator: (value) => AppValidator.validatePassword(value),
        obscureText: controller.obscureText!,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          labelText: AppTexts.password,
          prefixIcon: const Icon(Iconsax.password_check),
          suffixIcon: IconButton(
            icon: Icon(
              controller.obscureText! ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: controller.toggleObscureText,
          ),
        ),
      ),
    );
  }
}
