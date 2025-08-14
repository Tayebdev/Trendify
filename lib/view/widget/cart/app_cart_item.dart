import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../helpers/function_helpers.dart';
import '../home/app_rounded_image.dart';
import '../product/app_product_title_text.dart';
import '../store/brand_title_with_icon.dart';

class AppCartItem extends StatelessWidget {
  const AppCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppRoundedImage(
          imageUrl: AppImages.product,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(AppSizes.sm),
          backgroundColor: AppHelperFunctions.isDarkMode(context)
              ? AppColors.darkerGrey
              : AppColors.light,
        ),
        SizedBox(width: AppSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithIcon(title: "Nike"),
              Flexible(
                child: AppProductTitleText(
                  title: "Black Sports shoes",
                  maxLines: 1,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Colors :',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: ' Green',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: '  Size : ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'UK 08',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
