import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_failure.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/address/app_single_address.dart';
import '../../../controller/setting/address_controller.dart';
import '../../../core/class/status_request.dart';
import '../../widget/appbar/appbar.dart';

// ignore: must_be_immutable
class AddressView extends StatelessWidget {
  AddressView({super.key});
  AddressControllerImp controller = Get.put(AddressControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.goToAddNewAddress();
        },
        backgroundColor: AppColors.primary,
        child: Icon(Iconsax.add, size: AppSizes.iconLg, color: AppColors.white),
      ),
      appBar: UAppBar(showBackArrow: true, title: Text("Addresses")),
      body: GetBuilder<AddressControllerImp>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.failure) {
            return AppFailure(
              title: "No addresses found",
              subtitle:
                  "You haven’t added any address yet. Tap  the \n button to add one.",
            );
          }
          return HandleDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: AppPadding.screenPadding,
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => AppSingleAddress(
                      selected: controller.addressList[index].isSelected!,
                      index: index,
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 0),
                    itemCount: controller.addressList.length,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
