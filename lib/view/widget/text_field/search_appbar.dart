import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../../../utils/helpers/function_helpers.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: 0,
      left: AppSizes.spaceBtwSections,
      right: AppSizes.spaceBtwSections,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
        height: AppSizes.searchAppHeight,
        decoration: BoxDecoration(
          color: dark ? AppColors.dark : AppColors.light,
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 2,
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Iconsax.search_normal, color: AppColors.darkGrey),
            SizedBox(width: AppSizes.spaceBtwItems),
            Text(
              AppTexts.searchBarTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
