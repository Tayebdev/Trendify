import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controller/profile/edit_personal_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../../../core/functions/app_validator.dart';
import '../../../core/handle_data_view/handle_data_view.dart';
import '../../../core/style/app_padding.dart';
import '../../../utils/helpers/function_helpers.dart';
import '../../widget/appbar/appbar.dart';
import '../../widget/button/elevated_button.dart';
import '../../widget/text_field/text_field.dart';

class EditProfilePersonalView extends StatelessWidget {
  const EditProfilePersonalView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditPersonalControllerImp());
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          AppTexts.editProfile,
          style: Theme.of(context).textTheme.headlineMedium!.apply(
            color: dark ? AppColors.white : AppColors.dark,
          ),
        ),
      ),
      body: GetBuilder<EditPersonalControllerImp>(
        builder: (controller) => HandleDataView(
          showLoading: false,
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.screenPadding,
              child: Form(
                key: controller.formStateProfile,
                child: Column(
                  children: [
                    Text(
                     AppTexts.updateEmailAndPhone,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields),
                    AppTextField(
                      validator: (value) =>
                          AppValidator.validateEmail(value),
                      icon: Iconsax.direct_right,
                      text: AppTexts.firstName,
                      textEditingController: controller.email,
                      value: false,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields / 2),
                    AppTextField(
                      validator: (value) =>
                          AppValidator.validatePhoneNumber(value),
                      icon: Iconsax.call,
                      text: AppTexts.lastName,
                      textEditingController: controller.phone,
                      value: false,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields),
                    UElevatedButton(
                      onPressed: () {
                        controller.saveChangeProfilePersonal();
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
