import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_texts.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../core/constant/app_sizes.dart';
import '../../widget/button/elevated_button.dart';
import '../../widget/login_signup/form_divider.dart';
import '../../widget/login_signup/form_signup.dart';
import '../../widget/login_signup/privacy_policy.dart';
import '../../widget/login_signup/social_button.dart';

// ignore: must_be_immutable
class SignupView extends StatelessWidget {
  SignupView({super.key});
  SignupControllerImp controller = Get.put(SignupControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<SignupControllerImp>(
        builder: (controller) => HandleDataView(
          showLoading: false,
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              Form(
                key: controller.formState,
                child: Column(
                  children: [
                    AppFormSignup(),
                    SizedBox(height: AppSizes.spaceBtwInputFields),
                    AppPrivacyPolicy(),
                    SizedBox(height: AppSizes.spaceBtwSections / 2),
                    UElevatedButton(
                      onPressed: () {
                        controller.signUp();
                      },
                      child: Text(AppTexts.createAccount),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwSections / 2),
              AppFormDivider(),
              SizedBox(height: AppSizes.spaceBtwSections),
              AppSocialButton(),
            ],
          ),
        ),
      )
        ),
      ),
    );
  }
}
