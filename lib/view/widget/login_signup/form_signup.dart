import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../text_field/text_field.dart';
import '../text_field/text_field_password_signup.dart';

// ignore: must_be_immutable
class AppFormSignup extends StatelessWidget {
  AppFormSignup({super.key});
  SignupControllerImp controller = Get.put(SignupControllerImp());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppTextField(
                icon: Iconsax.user,
                text: AppTexts.firstName,
                textEditingController: controller.firsName,
                value: false,
              ),
            ),
            SizedBox(width: AppSizes.spaceBtwInputFields),
            Expanded(
              child: AppTextField(
                icon: Iconsax.user,
                text: AppTexts.lastName,
                textEditingController: controller.lastName,
                value: false,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.spaceBtwInputFields),
        AppTextField(
          icon: Iconsax.direct_right,
          text: AppTexts.email,
          textEditingController: controller.email,
          value: false,
        ),
        SizedBox(height: AppSizes.spaceBtwInputFields),
        AppTextField(
          icon: Iconsax.call,
          text: AppTexts.phoneNumber,
          textEditingController: controller.phone,
          value: false,
        ),
        SizedBox(height: AppSizes.spaceBtwInputFields),
        AppTextFieldPasswordSignup(),
        SizedBox(height: AppSizes.spaceBtwInputFields),
        AppTextField(
          icon: Iconsax.password_check,
          text: AppTexts.confirmPassword,
          textEditingController: controller.confirmPassword,
          value: true,
        ),
      ],
    );
  }
}
