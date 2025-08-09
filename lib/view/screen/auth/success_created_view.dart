import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../../../core/style/app_padding.dart';
import '../../../helpers/device_helpers.dart';
import '../../widget/button/elevated_button.dart';

class SuccessCreatedView extends StatelessWidget {
  const SuccessCreatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppPadding.screenPadding,
        child: Column(
          children: [
            Image.asset(
              AppImages.accountCreatedImage,
              height: UDeviceHelper.getScreenHeight(context) * 0.4,
            ),
            Text(
              AppTexts.accountCreatedTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppSizes.spaceBtwItems),
            Text(
              AppTexts.accountCreatedSubTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: AppSizes.spaceBtwSections),
            UElevatedButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.navigationMenu);
              },
              child: Text(AppTexts.uContinue),
            ),
          ],
        ),
      ),
    );
  }
}
