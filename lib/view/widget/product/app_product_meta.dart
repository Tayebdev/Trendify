import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/view/widget/image_widget/circular_image.dart';
import 'package:trendify_app/view/widget/product/app_product_title_text.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../rounded_container/rounded_container.dart';
import '../store/brand_title_with_icon.dart';

class AppProductMeta extends StatelessWidget {
  const AppProductMeta({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppRoundedContainer(
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
            SizedBox(width: AppSizes.spaceBtwItems),
            Text(
              "\$250",
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: AppSizes.spaceBtwItems),
            Text("\$175", style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
        SizedBox(height: AppSizes.spaceBtwItems / 1.5),
        AppProductTitleText(title: "Green Nike Sport Shirt"),
        SizedBox(height: AppSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            AppProductTitleText(title: "Status :"),
            SizedBox(width: AppSizes.xs),
            Text("In Stock", style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
        SizedBox(height: AppSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            AppCircularImage(image: AppImages.brand, width: 62, height: 62),
            BrandTitleWithIcon(title: "Nike"),
          ],
        ),
      ],
    );
  }
}
