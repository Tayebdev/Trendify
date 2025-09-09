import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controller/profile/edit_password_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_texts.dart';
import '../../../core/functions/app_validator.dart';

class TextFieldPasswordChanged extends StatelessWidget {
  const TextFieldPasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditPasswordControllerImp>(
      builder: (controller) => TextFormField(
        validator: (value) => AppValidator.validatePassword(value),
        controller: controller.password,
        obscureText: controller.obscureText,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          labelText: AppTexts.password,
          prefixIcon: const Icon(Iconsax.password_check),
          suffixIcon: IconButton(
            icon: Icon(
              controller.obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: controller.toggleObscureText,
          ),
        ),
      ),
    );
  }
}
