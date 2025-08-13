import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/helpers/function_helpers.dart';
import 'package:trendify_app/view/widget/circular_icon/circular_icon.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace,
        vertical: AppSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? AppColors.darkerGrey : AppColors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.cardRadiusLg),
          topRight: Radius.circular(AppSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: AppColors.darkGrey,
                color: AppColors.white,
                height: 40,
                width: 40,
              ),
              SizedBox(width: AppSizes.spaceBtwItems),
              Text("2", style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: AppSizes.spaceBtwItems),
              AppCircularIcon(
                icon: Iconsax.add,
                backgroundColor: AppColors.dark,
                color: AppColors.white,
                height: 40,
                width: 40,
              ),
              SizedBox(width: AppSizes.spaceBtwItems),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(AppSizes.md),
              backgroundColor: AppColors.primary,
              side: BorderSide(color: AppColors.primary),
            ),
            child: Row(
              children: [
                Icon(Iconsax.shop_add, size: AppSizes.iconSm + 2),
                SizedBox(width: AppSizes.sm),
                Text("Add to Cart"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
