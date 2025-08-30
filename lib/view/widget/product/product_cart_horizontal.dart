import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';

import '../../../utils/helpers/function_helpers.dart';
import '../home/app_rounded_image.dart';
import '../rounded_container/rounded_container.dart';
import '../store/brand_title_with_icon.dart';
import 'app_product_title_text.dart';
import 'product_card_add_to_cart_button.dart';

class AppProductCardHorizontal extends StatelessWidget {
  const AppProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Container(
      width: 280,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
        color: dark ? AppColors.darkerGrey : AppColors.grey,
      ),
      child: Row(
        children: [
          AppRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(AppSizes.sm),
            backgroundColor: dark ? AppColors.dark : AppColors.light,
            child: Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: AppRoundedImage(
                    imageUrl: AppImages.product,
                    applayImageRadius: true,
                  ),
                ),
                AppRoundedContainer(
                  radius: AppSizes.sm,
                  // ignore: deprecated_member_use
                  backgroundColor: AppColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.sm,
                    vertical: AppSizes.xs,
                  ),
                  child: Text(
                    '20',
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge!.apply(color: AppColors.black),
                  ),
                ),
                Positioned(right: 0, top: 0, child: Icon(Iconsax.heart)),
              ],
            ),
          ),
          SizedBox(
            width: 142,
            child: Padding(
              padding: const EdgeInsets.only(
                top: AppSizes.sm,
                left: AppSizes.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppProductTitleText(title: "product", smallSize: true),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  BrandTitleWithIcon(title: "Nike"),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      Flexible(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: AppSizes.sm),
                              child: Text(
                                "\$76",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: AppSizes.sm),
                              child: Text(
                                "\$100",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness:
                                          2, // thickness of the line
                                      decorationColor: dark
                                          ? AppColors.light
                                          : AppColors
                                                .black, // color of the line
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ProductCardAddToCartButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
