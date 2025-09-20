import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';
import '../../../controller/setting/address_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../rounded_container/rounded_container.dart';

// ignore: must_be_immutable
class AppSingleAddress extends StatelessWidget {
  AppSingleAddress({super.key, required this.selected, this.index});
  final bool selected;
  int? index;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return GetBuilder<AddressControllerImp>(
      builder: (controller) => Dismissible(
        key: Key(controller.addressList[index!].sId!),
        onDismissed: (direction) =>
            controller.deleteAddressUser(controller.addressList[index!].sId!),
        background: Container(
          decoration: BoxDecoration(
            color: AppColors.error,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(Iconsax.trash, color: Colors.white),
        ),
        child: GestureDetector(
          onTap: (){},
          child: AppRoundedContainer(
            showBorder: true,
            width: double.infinity,
            backgroundColor: selected
                // ignore: deprecated_member_use
                ? AppColors.primary.withOpacity(0.5)
                : Colors.transparent,
            borderColor: selected
                // ignore: dead_code
                ? Colors.transparent
                : dark
                ? AppColors.darkerGrey
                : AppColors.grey,
            margin: EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
            padding: EdgeInsets.all(AppSizes.defaultSpace / 3),
            child: Stack(
              children: [
                Positioned(
                  right: 10,
                  top: 0,
                  child: Icon(
                    selected ? Iconsax.tick_circle5 : null,
                    color: selected
                        ? dark
                              ? AppColors.light
                              : AppColors.dark
                        : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.addressList[index!].name}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: AppSizes.sm / 2),
                    Text(
                      "(+213) ${controller.addressList[index!].phone}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppSizes.sm / 2),
                    Text(
                      "${controller.addressList[index!].street} ,${controller.addressList[index!].city},${controller.addressList[index!].country}",
                      softWrap: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
