import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/helpers/function_helpers.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../rounded_container/rounded_container.dart';

class AppSingleAddress extends StatelessWidget {
  const AppSingleAddress({super.key, required this.selected});
  final bool selected;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return AppRoundedContainer(
      showBorder: true,
      width: double.infinity,
      backgroundColor: selected
          // ignore: deprecated_member_use
          ? AppColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selected
          // ignore: dead_code
          ? Colors.transparent
          : dark
          ? AppColors.darkerGrey
          : AppColors.grey,
      margin: EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      padding: EdgeInsets.all(AppSizes.defaultSpace / 3),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            top: 0,
            child: Icon(
              selected ? Iconsax.tick_circle5 : null,
              color: selected
                  ? dark
                        ? AppColors.light
                        : AppColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Boulekzazel Tayeb",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: AppSizes.sm / 2),
              Text(
                "(+213) 777 34 22 52",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AppSizes.sm / 2),
              Text(
                "82356 Timmy coves, south Liana,maine ,87665 ,USA",
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
