// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import 'app_vertical_image_text.dart';

class AppCategoryHome extends StatelessWidget {
  const AppCategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.popularCategories,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: AppColors.white),
          ),
          SizedBox(height: AppSizes.spaceBtwItems),
          SizedBox(
            height: 90,
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  SizedBox(width: AppSizes.spaceBtwItems),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return AppVerticalImageText(
                  title: "Sport",
                  image: AppImages.sport,
                  onTap: () {},
                  textColor: AppColors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
