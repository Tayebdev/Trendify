import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/controller/auth/login_controller.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../button/elevated_button.dart';
import '../button/outlined_button.dart';
import '../text_field/text_field.dart';
import '../text_field/text_field_password_login.dart';

// ignore: must_be_immutable
class AppFormLogin extends StatelessWidget {
  AppFormLogin({super.key});
  LoginControllerImp controller = Get.put(LoginControllerImp());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          icon: Iconsax.direct_right,
          text: AppTexts.email,
          textEditingController: controller.email,
        ),
        SizedBox(height: AppSizes.spaceBtwInputFields),
        AppTextFieldPasswordLogin(),
        SizedBox(height: AppSizes.spaceBtwInputFields),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text(AppTexts.rememberMe),
              ],
            ),
            TextButton(
              onPressed: () {
                controller.goToForgetPassword();
              },
              child: Text(
                AppTexts.forgetPassword,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),

        SizedBox(height: AppSizes.spaceBtwSections / 2),
        UElevatedButton(onPressed: () {controller.goToNavigationMenu();}, child: Text(AppTexts.signIn)),
        SizedBox(height: AppSizes.spaceBtwItems),
        UOutlinedButton(onPressed: () {controller.goToSignUp();}, child: Text(AppTexts.createAccount)),
      ],
    );
  }
}
