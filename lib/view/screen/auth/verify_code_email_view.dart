import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import '../../../controller/auth/verify_code_email_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../../widget/button/elevated_button.dart';

// ignore: must_be_immutable
class VerifyCodeEmailView extends StatelessWidget {
  VerifyCodeEmailView({super.key});
  VerifyCodeEmailControllerImp controller = Get.put(VerifyCodeEmailControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
              Lottie.asset(
                AppImages.sentEmailAnimation,
                width: 200,
                height: 200,
              ),
              Text(
                AppTexts.checkYourMessage,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: AppSizes.spaceBtwItems),
              Text(
                "ttayeb769@gmail.com",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: AppSizes.spaceBtwItems),
              Text(
                AppTexts.verifyCodeEmail,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              OtpTextField(
                numberOfFields: 4,
                borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
                fieldHeight: 60,
                fieldWidth: 55,
                showFieldAsBox: true,
                enabledBorderColor: AppColors.grey,
                focusedBorderColor: AppColors.primary,
                cursorColor: AppColors.primary,
                fillColor: AppColors.primary,
                textStyle: TextStyle().copyWith(
                  fontSize: AppSizes.fontSizeMd,
                  fontWeight: FontWeight.bold,
                ),
                onSubmit: (String verificationCode) {
                  // handle submission
                },
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              UElevatedButton(
                onPressed: () {controller.goToSuccesCreated();},
                child: Text(AppTexts.uContinue),
              ),
              SizedBox(height: AppSizes.spaceBtwItems),
              TextButton(
                onPressed: () {
                  controller.goToForgetPassword();
                },
                child: Text(
                  AppTexts.sendCode,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
