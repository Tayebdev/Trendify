import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_texts.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/helpers/device_helpers.dart';
import '../../../controller/auth/verify_email_controller.dart';
import '../../../core/constant/app_sizes.dart';
import '../../widget/button/elevated_button.dart';

// ignore: must_be_immutable
class VerifyEmailView extends StatelessWidget {
  VerifyEmailView({super.key});
  VerifyEmailControllerImp controller = Get.put(VerifyEmailControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.goToLogin();
            },
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: Padding(
        padding: AppPadding.screenPadding,
        child: Column(
          children: [
            Image.asset(
              AppImages.mailSentImage,
              height: UDeviceHelper.getScreenHeight(context) * 0.4,
            ),
            Text(
              AppTexts.verifyEmailTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppSizes.spaceBtwItems),
            Text(
              "ttayeb769@gmail.com",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: AppSizes.spaceBtwItems),
            Text(
              AppTexts.verifyEmailSubTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: AppSizes.spaceBtwSections),
            UElevatedButton(
              onPressed: () {
                controller.goToVerifyCode();
              },
              child: Text(AppTexts.uContinue),
            ),
          ],
        ),
      ),
    );
  }
}
