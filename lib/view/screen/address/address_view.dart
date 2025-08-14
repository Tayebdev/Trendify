import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/address/app_single_address.dart';
import '../../../controller/address_controller.dart';
import '../../widget/appbar/appbar.dart';

// ignore: must_be_immutable
class AddressView extends StatelessWidget {
  AddressView({super.key});
  AddressControllerImp controller = Get.put(AddressControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {controller.goToAddNewAddress();},
        backgroundColor: AppColors.primary,
        child: Icon(Iconsax.add, size: AppSizes.iconLg),
      ),
      appBar: UAppBar(showBackArrow: true, title: Text("Addresses")),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
              AppSingleAddress(selected: true),
              AppSingleAddress(selected: false),
            ],
          ),
        ),
      ),
    );
  }
}
