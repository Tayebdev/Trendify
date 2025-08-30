import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../utils/helpers/function_helpers.dart';
import '../circular_contianer/circular_container.dart';

// ignore: must_be_immutable
class AppVerticalImageText extends StatelessWidget {
  const AppVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
  });
  final String? title;
  final String? image;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final dark=AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircularContainer(
            height: 56,
            width: 56,
            padding: EdgeInsets.all(AppSizes.sm),
            backgroundColor: backgroundColor ?? (dark ? AppColors.dark :AppColors.light),
            child: Image.asset(image!, fit: BoxFit.cover),
          ),
          SizedBox(height: AppSizes.spaceBtwItems / 2),
          SizedBox(
            width: 55,
            child: Text(
              title!,
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.apply(color: textColor),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
