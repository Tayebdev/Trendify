import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import '../../../controller/auth/verify_code_password_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../../widget/button/elevated_button.dart';

// ignore: must_be_immutable
class VerifyCodePasswordView extends StatelessWidget {
  VerifyCodePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodePasswordControllerImp());
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<VerifyCodePasswordControllerImp>(
        builder: (controller) => HandleDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
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
                    "${controller.email}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  Text(
                    AppTexts.verifyCodePassword,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  OtpTextField(
                    numberOfFields: 4,
                    borderRadius: BorderRadius.circular(
                      AppSizes.inputFieldRadius,
                    ),
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
                      controller.verifyCode = verificationCode;
                    },
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  UElevatedButton(
                    onPressed: () {
                      controller.goToUpdatePassword();
                    },
                    child: Text(AppTexts.uContinue),
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  Obx(() {
                    if (controller.remainingSeconds.value == 0) {
                      return TextButton(
                        onPressed: controller.goToForgetPassword(),
                        child: Text(
                          "Resend Code",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary,
                          ),
                        ),
                      );
                    } else {
                      final minutes = (controller.remainingSeconds.value ~/ 60)
                          .toString()
                          .padLeft(2, '0');
                      final seconds = (controller.remainingSeconds.value % 60)
                          .toString()
                          .padLeft(2, '0');
                      return Text(
                        "Resend available in $minutes:$seconds",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
