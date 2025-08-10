import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';

class BrandTitleWithIcon extends StatelessWidget {
  const BrandTitleWithIcon({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(width: AppSizes.xs),
        Icon(Iconsax.verify5, color: AppColors.primary, size: AppSizes.iconXs),
      ],
    );
  }
}
