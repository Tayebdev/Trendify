import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/controller/auth/update_password_controller.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../../../core/functions/app_validator.dart';
import '../../../core/style/app_padding.dart';
import '../../widget/button/elevated_button.dart';
import '../../widget/text_field/text_field.dart';
import '../../widget/text_field/text_field_password_updated.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdatePasswordControllerImp());
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<UpdatePasswordControllerImp>(
        builder: (controller) => SingleChildScrollView(
          child: HandleDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: AppPadding.screenPadding,
              child: Center(
                child: Form(
                  key: controller.formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppTexts.updatePasswordTitle,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: AppSizes.sm),
                          Text(AppTexts.updatePasswordSubTitle),
                        ],
                      ),
                      SizedBox(height: AppSizes.spaceBtwSections),
                      AppTextFieldPasswordUpadated(),
                      SizedBox(height: AppSizes.spaceBtwInputFields),
                      AppTextField(
                        validator: (value) =>
                            AppValidator.validatePassword(value),
                        icon: Iconsax.password_check,
                        text: AppTexts.confirmPassword,
                        textEditingController: controller.confirmPassword,
                        value: true,
                      ),
                      SizedBox(height: AppSizes.spaceBtwSections / 2),
                      UElevatedButton(
                        onPressed: () {
                          controller.goToHome();
                        },
                        child: Text(AppTexts.updatePassword),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
