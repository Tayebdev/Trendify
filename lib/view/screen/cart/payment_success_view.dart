import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../../../core/style/app_padding.dart';
import '../../widget/button/elevated_button.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.payment, width: 200, height: 200),
            SizedBox(height: AppSizes.spaceBtwItems * 2),
            Text(
              AppTexts.payment,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppSizes.spaceBtwItems),
            Text(
              AppTexts.subTitlePayment,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: AppSizes.spaceBtwSections),
            UElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.navigationMenu);
              },
              child: Text("Continue Shopping"),
            ),
          ],
        ),
      ),
    );
  }
}
