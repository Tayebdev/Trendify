import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controller/cart_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../utils/helpers/function_helpers.dart';
import '../circular_icon/circular_icon.dart';

// ignore: must_be_immutable
class AppProductQuantityAddRemove extends StatelessWidget {
  int? index;
  AppProductQuantityAddRemove({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      builder: (controller) => Row(
        children: [
          AppCircularIcon(
            icon: Iconsax.minus,
            width: 32,
            height: 32,
            size: AppSizes.md,
            color: AppHelperFunctions.isDarkMode(context)
                ? AppColors.white
                : AppColors.black,
            backgroundColor: AppHelperFunctions.isDarkMode(context)
                ? AppColors.darkerGrey
                : AppColors.grey,
          ),
          SizedBox(width: AppSizes.spaceBtwItems),
          Text(
            "${controller.cartList[0].cartItems![index!].quantity!}",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(width: AppSizes.spaceBtwItems),
          AppCircularIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: AppSizes.md,
            color: AppHelperFunctions.isDarkMode(context)
                ? AppColors.white
                : AppColors.black,
            backgroundColor: AppHelperFunctions.isDarkMode(context)
                ? AppColors.primary
                : AppColors.primary,
          ),
        ],
      ),
    );
  }
}
