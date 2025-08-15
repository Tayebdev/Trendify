import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSizes.cardRadiusMd),
            bottomRight: Radius.circular(AppSizes.productImageRadius),
          ),
        ),
        child: SizedBox(
          width: AppSizes.iconLg * 1.2,
          height: AppSizes.iconLg * 1.2,
          child: Center(child: const Icon(Iconsax.add, color: AppColors.white)),
        ),
      ),
    );
  }
}
