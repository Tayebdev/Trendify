import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/controller/profile/edit_password_controller.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../../../core/functions/app_validator.dart';
import '../../../core/style/app_padding.dart';
import '../../../utils/helpers/function_helpers.dart';
import '../../widget/appbar/appbar.dart';
import '../../widget/button/elevated_button.dart';
import '../../widget/text_field/text_field.dart';
import '../../widget/text_field/text_field_password_changed.dart';

class EditPasswordView extends StatelessWidget {
  const EditPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(EditPasswordControllerImp());

    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          "Edit Password",
          style: Theme.of(context).textTheme.headlineMedium!.apply(
            color: dark ? AppColors.white : AppColors.dark,
          ),
        ),
      ),
      body: GetBuilder<EditPasswordControllerImp>(
        builder: (controller) => HandleDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.screenPadding,
              child: Form(
                key: controller.formState,
                child: Column(
                  children: [
                    Text(
                      AppTexts.changePassword,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields),
                    AppTextField(
                      validator: (value) =>
                          AppValidator.validatePassword(value),
                      icon: Iconsax.password_check,
                      text: AppTexts.currentPassword,
                      textEditingController: controller.currentPassword,
                      value: true,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields / 2),
                    TextFieldPasswordChanged(),
                    SizedBox(height: AppSizes.spaceBtwInputFields / 2),
                    AppTextField(
                      validator: (value) =>
                          AppValidator.validatePassword(value),
                      icon: Iconsax.password_check,
                      text: AppTexts.confirmPassword,
                      textEditingController: controller.confirmPassword,
                      value: true,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields),
                    UElevatedButton(
                      onPressed: () {
                        controller.editPassword();
                      },
                      child: Text("Save"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
