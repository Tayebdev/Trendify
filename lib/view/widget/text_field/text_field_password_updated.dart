import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_texts.dart';
import 'package:trendify_app/core/functions/app_validator.dart';
import '../../../controller/auth/update_password_controller.dart';

class AppTextFieldPasswordUpadated extends StatelessWidget {
  const AppTextFieldPasswordUpadated({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdatePasswordControllerImp>(
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
