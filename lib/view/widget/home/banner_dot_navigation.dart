import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/app_colors.dart';

// ignore: must_be_immutable
class BannerDotNavigation extends StatelessWidget {
  BannerDotNavigation({super.key});
  final controller = HomeControllerImp.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SmoothPageIndicator(
        count: 5,
        effect: ExpandingDotsEffect(
          dotHeight: 6,
          activeDotColor: AppColors.primary,
        ),
        controller: PageController(initialPage: controller.currentPage.value),
      ),
    );
  }
}
