import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../helpers/function_helpers.dart';
import '../circular_icon/circular_icon.dart';

class AppProductQuantityAddRemove extends StatelessWidget {
  const AppProductQuantityAddRemove({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Text("2", style: Theme.of(context).textTheme.titleSmall),
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
    );
  }
}
