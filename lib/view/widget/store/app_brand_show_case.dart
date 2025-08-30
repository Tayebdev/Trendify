import 'package:flutter/material.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizes.dart';
import '../rounded_container/rounded_container.dart';
import 'brand_card.dart';

class AppBrandShowCase extends StatelessWidget {
  const AppBrandShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return AppRoundedContainer(
      showBorder: true,
      borderColor: AppColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(AppSizes.md),
      margin: EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BrandCard(
            onTap: () {},
            showBorder: false,
            imageUrl: AppImages.brand,
            numberProduct: "172 product",
            title: "Bata",
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return AppRoundedContainer(
                  height: 100,
                  padding: const EdgeInsets.all(AppSizes.sm),
                  backgroundColor: dark
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : AppColors.grey,
                  child: Image.asset(AppImages.product, fit: BoxFit.contain),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: AppSizes.sm),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
