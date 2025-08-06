import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/data/static/static.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/app_sizes.dart';
import '../button/elevated_button.dart';

class OboardingNextButton extends StatelessWidget {
  const OboardingNextButton({super.key});
  static final controller = OnboardingControllerImp.instance;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: AppSizes.spaceBtwItems + 30,
      child: UElevatedButton(
        onPressed: controller.nextPage,
        child: Obx(
          () => Text(
            controller.currentPage.value == onboardingList.length - 1
                ? 'Get Started'
                : 'Next',
          ),
        ),
      ),
    );
  }
}
