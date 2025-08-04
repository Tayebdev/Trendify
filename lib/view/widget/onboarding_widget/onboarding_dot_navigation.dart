import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../data/static/static.dart';
import '../../../helpers/device_helpers.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({super.key});
  static final controller=OnboardingControllerImp.instance;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: UDeviceHelper.getBottomNavigationBarHeight() * 4,
      left: UDeviceHelper.getScreenWidth(context) / 3,
      right: UDeviceHelper.getScreenWidth(context) / 3,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: (index) => controller.dotNavigationClick(index),
        count: onboardingList.length,
        effect: ExpandingDotsEffect(dotHeight: 6),
      ),
    );
  }
}
