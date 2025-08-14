import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../helpers/function_helpers.dart';
import '../../widget/home/section_header.dart';
import '../../widget/rounded_container/rounded_container.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: "Payment Method",
          textButton: "Change",
          onPressed: () {},
        ),
        SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            AppRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: AppHelperFunctions.isDarkMode(context)
                  ? AppColors.light
                  : AppColors.white,
              padding: EdgeInsets.all(AppSizes.sm),
              child: Image(
                image: AssetImage(AppImages.masterCard),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: AppSizes.spaceBtwItems / 2),
            Text("Master Card", style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
