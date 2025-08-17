import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_texts.dart';
import 'package:trendify_app/core/functions/app_validator.dart';

import '../../../controller/auth/login_controller.dart';

// ignore: must_be_immutable
class AppTextFieldPasswordLogin extends StatelessWidget {
   const AppTextFieldPasswordLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginControllerImp>(
      builder: (controller) => TextFormField(
        validator: (value) => AppValidator.validatePassword(value),
        controller: controller.password,
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
