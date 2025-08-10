import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/helpers/function_helpers.dart';
import 'package:trendify_app/view/widget/home/app_rounded_image.dart';
import 'package:trendify_app/view/widget/product/app_product_title_text.dart';
import 'package:trendify_app/view/widget/rounded_container/rounded_container.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../circular_icon/circular_icon.dart';

class ProductCartVertical extends StatelessWidget {
  const ProductCartVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        //margin: EdgeInsets.symmetric(horizontal: AppSizes.xs,vertical: AppSizes.md),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.1),
              spreadRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
        ),
        child: Column(
          children: [
            AppRoundedContainer(
              width: 180,
              padding: EdgeInsets.all(AppSizes.sm),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  AppRoundedImage(imageUrl: AppImages.product),
                  Positioned(
                    top: 12.0,
                    child: AppRoundedContainer(
                      radius: AppSizes.sm,
                      backgroundColor: AppColors.yellow,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm,
                        vertical: AppSizes.xs,
                      ),
                      child: Text(
                        '20%',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: AppColors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: AppCircularIcon(
                      color: dark ? AppColors.light : AppColors.dark,
                      icon: Iconsax.heart,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppProductTitleText(
                    title: "Blue INDURE Shoes",
                    smallSize: true,
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        "Bata",
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: AppSizes.xs),
                      Icon(
                        Iconsax.verify5,
                        color: AppColors.primary,
                        size: AppSizes.iconXs,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$76",
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "\$100",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2, // thickness of the line
                          decorationColor: dark
                              ? AppColors.light
                              : AppColors.black, // color of the line
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: AppSizes.xl),
                      Container(
                        width: AppSizes.iconLg * 1.2,
                        height: AppSizes.iconLg * 1.2,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              AppSizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Iconsax.add, color: AppColors.light),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
