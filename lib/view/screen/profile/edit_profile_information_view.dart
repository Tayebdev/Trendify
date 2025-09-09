import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import '../../../controller/profile/edit_profile_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../../../core/functions/app_validator.dart';
import '../../../utils/helpers/function_helpers.dart';
import '../../widget/appbar/appbar.dart';
import '../../widget/button/elevated_button.dart';
import '../../widget/text_field/text_field.dart';

class EditProfileViewInformation extends StatelessWidget {
  const EditProfileViewInformation({super.key}); // Make const constructor

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileControllerImp());
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
      body: GetBuilder<EditProfileControllerImp>(
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
                      "Update your name to keep your profile accurate and personalized",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields),
                    AppTextField(
                      validator: (value) =>
                          AppValidator.validateEmptyText("firstName", value),
                      icon: Iconsax.user,
                      text: AppTexts.firstName,
                      textEditingController: controller.firstName,
                      value: false,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields / 2),
                    AppTextField(
                      validator: (value) =>
                          AppValidator.validateEmptyText("lastName", value),
                      icon: Iconsax.user,
                      text: AppTexts.lastName,
                      textEditingController: controller.lastName,
                      value: false,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields),
                    UElevatedButton(
                      onPressed: () {
                        controller.saveChangeProfileInformation();
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
