import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconsax/iconsax.dart';
import '../../../controller/product/product_details_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/foundation.dart';

class AppRatingAndShare extends StatelessWidget {
  const AppRatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => Row(
            children: [
              Icon(
                Iconsax.star5,
                color: AppColors.yellow,
                size: AppSizes.iconMd,
              ),
              SizedBox(width: AppSizes.spaceBtwItems / 2),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${controller.product?.ratingAverage}.0",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(text: "  (${controller.product?.quantityResidents})"),
                  ],
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            if (defaultTargetPlatform == TargetPlatform.android ||
                defaultTargetPlatform == TargetPlatform.iOS) {
              // ignore: deprecated_member_use
              Share.share(
                'check out my website https://example.com',
                subject: 'My Website',
              );
            } else {
              debugPrint("Sharing not supported on this platform");
            }
          },
          icon: Icon(Iconsax.share),
        ),
      ],
    );
  }
}
