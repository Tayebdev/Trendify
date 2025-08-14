import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/button/elevated_button.dart';
import '../../widget/appbar/appbar.dart';
import '../../widget/text_field/text_field.dart';

class AddNewAddressView extends StatelessWidget {
  const AddNewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text("Add new address")),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Form(
            child: Column(
              children: [
                AppTextField(
                  icon: Iconsax.user,
                  text: "Name",
                  textEditingController: TextEditingController(),
                ),
                SizedBox(height: AppSizes.spaceBtwInputFields),
                AppTextField(
                  icon: Iconsax.mobile,
                  text: "Phone Number",
                  textEditingController: TextEditingController(),
                ),
                SizedBox(height: AppSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        icon: Iconsax.building_31,
                        text: "Street",
                        textEditingController: TextEditingController(),
                      ),
                    ),
                    SizedBox(width: AppSizes.spaceBtwInputFields / 2),
                    Expanded(
                      child: AppTextField(
                        icon: Iconsax.code,
                        text: "Postal Code",
                        textEditingController: TextEditingController(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        icon: Iconsax.building,
                        text: "City",
                        textEditingController: TextEditingController(),
                      ),
                    ),
                    SizedBox(width: AppSizes.spaceBtwInputFields / 2),
                    Expanded(
                      child: AppTextField(
                        icon: Iconsax.activity,
                        text: "State",
                        textEditingController: TextEditingController(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.spaceBtwInputFields),
                AppTextField(
                  icon: Iconsax.global,
                  text: "Country",
                  textEditingController: TextEditingController(),
                ),
                SizedBox(height: AppSizes.defaultSpace),
                UElevatedButton(onPressed: () {}, child: Text("Save")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
