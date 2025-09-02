import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/view/widget/image_widget/shimmer_effect.dart';

class AppCategoryShimmer extends StatelessWidget {
  const AppCategoryShimmer({super.key, this.itemCount = 8});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: AppSizes.spaceBtwItems,
        ),
        itemBuilder: (context, index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: AppSizes.spaceBtwItems / 2,
              ),
              AppShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
