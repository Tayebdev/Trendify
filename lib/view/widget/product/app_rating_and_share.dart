import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';

class AppRatingAndShare extends StatelessWidget {
  const AppRatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Iconsax.star5, color: AppColors.yellow, size: AppSizes.iconMd),
            SizedBox(width: AppSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "4.9",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(text: "  (152)"),
                ],
              ),
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Iconsax.share)),
      ],
    );
  }
}
