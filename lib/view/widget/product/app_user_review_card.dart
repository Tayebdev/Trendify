import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:trendify_app/helpers/function_helpers.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizes.dart';
import '../rounded_container/rounded_container.dart';
import 'app_rating_bar_indicator.dart';

class AppUserReviewCard extends StatelessWidget {
  const AppUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(AppImages.user)),
                SizedBox(width: AppSizes.spaceBtwItems),
                Text(
                  "Boulekzazel Islem",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),

        SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            AppRatingBarIndicator(rating: 3.5),
            SizedBox(width: AppSizes.spaceBtwItems),
            Text("01 NOV, 2025", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: AppSizes.spaceBtwItems / 2),
        ReadMoreText(
          "The user interface of the app is quite intuitive. I was to navigate and make pruchases seamlessly. Great job !",
          trimLines: 2,
          trimCollapsedText: "Less",
          trimExpandedText: "Show more",
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        AppRoundedContainer(
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
          child: Padding(
            padding: EdgeInsetsGeometry.all(AppSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trendify Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "01 NOV, 2025",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.spaceBtwItems),
                ReadMoreText(
                  "The user interface of the app is quite intuitive. I was to navigate and make pruchases seamlessly. Great job !",
                  trimLines: 2,
                  trimCollapsedText: "Less",
                  trimExpandedText: "Show more",
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
