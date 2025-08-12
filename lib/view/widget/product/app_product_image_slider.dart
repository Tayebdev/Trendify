import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../helpers/function_helpers.dart';
import '../appbar/appbar.dart';
import '../circular_icon/circular_icon.dart';
import '../home/app_rounded_image.dart';
import '../setting/app_curved_edges_widget.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final dark = AppHelperFunctions.isDarkMode(context);
    return AppCurvedEdgesWidget(
      child: Container(
        color: dark ? AppColors.darkerGrey : AppColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.productImageRadius * 2),
                child: Center(child: Image.asset(AppImages.product)),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: AppSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: // example, the third image is selected
                ListView.separated(
                  
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    bool isSelected = index == selectedIndex;
                    return AppRoundedImage(
                      imageUrl: AppImages.product,
                      width: 80,
                      backgroundColor: dark ? AppColors.dark : AppColors.light,
                      border: Border.all(
                        color: isSelected ? AppColors.primary : Colors.transparent,
                        width: 2,
                      ),
                      padding: EdgeInsets.all(AppSizes.sm),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(width: AppSizes.spaceBtwItems),
                  itemCount: 7,
                ),
              ),
            ),
            UAppBar(
              showBackArrow: true,
              actions: [
                AppCircularIcon(
                  icon: Iconsax.heart,
                  color: dark ? AppColors.light : AppColors.dark,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
