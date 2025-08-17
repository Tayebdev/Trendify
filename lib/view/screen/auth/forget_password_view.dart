import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/controller/auth/forget_password_controller.dart';
import 'package:trendify_app/core/constant/app_texts.dart';
import 'package:trendify_app/core/style/app_padding.dart';

import '../../../core/constant/app_sizes.dart';
import '../../widget/button/elevated_button.dart';
import '../../widget/text_field/text_field.dart';

// ignore: must_be_immutable
class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});
  ForgetPasswordControllerImp controller = Get.put(
    ForgetPasswordControllerImp(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppPadding.screenPadding,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.forgetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: AppSizes.sm),
                Text(AppTexts.forgetPasswordSubTitle),
              ],
            ),
            SizedBox(height: AppSizes.spaceBtwSections * 2),
            AppTextField(
              validator: (p0) {return null;},
              icon: Iconsax.direct_right,
              text: AppTexts.email,
              textEditingController: controller.email,
            ),
            SizedBox(height: AppSizes.spaceBtwSections),
            UElevatedButton(onPressed: () {controller.goToVerifyCode();}, child: Text(AppTexts.submit)),
          ],
        ),
      ),
    );
  }
}
