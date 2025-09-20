import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/functions/app_validator.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/button/elevated_button.dart';
import '../../../controller/setting/address_controller.dart';
import '../../widget/appbar/appbar.dart';
import '../../widget/text_field/text_field.dart';

class AddNewAddressView extends StatelessWidget {
  const AddNewAddressView({super.key});
  static final controller = AddressControllerImp.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text("Add new address")),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Form(
            key: controller.formState,
            child: Column(
              children: [
                AppTextField(
                  value: false,
                  validator: (value) =>
                      AppValidator.validateEmptyText("Name", value),
                  icon: Iconsax.user,
                  text: "Name",
                  textEditingController: controller.name,
                ),
                SizedBox(height: AppSizes.spaceBtwInputFields),
                AppTextField(
                  value: false,
                  validator: (value) =>
                      AppValidator.validateEmptyText("Phone Number", value),
                  icon: Iconsax.mobile,
                  text: "Phone Number",
                  textEditingController: controller.phone,
                ),
                SizedBox(height: AppSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        value: false,
                        validator: (value) =>
                            AppValidator.validateEmptyText("Street", value),
                        icon: Iconsax.building_31,
                        text: "Street",
                        textEditingController: controller.street,
                      ),
                    ),
                    SizedBox(width: AppSizes.spaceBtwInputFields / 2),
                    Expanded(
                      child: AppTextField(
                        value: false,
                        validator: (value) => AppValidator.validateEmptyText(
                          "Postal code",
                          value,
                        ),
                        icon: Iconsax.code,
                        text: "Postal Code",
                        textEditingController: controller.postalCode,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        value: false,
                        validator: (value) =>
                            AppValidator.validateEmptyText("City", value),
                        icon: Iconsax.building,
                        text: "City",
                        textEditingController: controller.city,
                      ),
                    ),
                    SizedBox(width: AppSizes.spaceBtwInputFields / 2),
                    Expanded(
                      
                      child: AppTextField(
                        value: false,
                        validator: (value) =>
                            AppValidator.validateEmptyText("State", value),
                        icon: Iconsax.activity,
                        text: "State",
                        textEditingController: controller.state,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.spaceBtwInputFields),
                AppTextField(
                  value: false,
                  validator: (value) =>
                      AppValidator.validateEmptyText("Country", value),
                  icon: Iconsax.global,
                  text: "Country",
                  textEditingController: controller.country,
                ),
                SizedBox(height: AppSizes.defaultSpace),
                UElevatedButton(
                  onPressed: () => controller.addAddress(),
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
