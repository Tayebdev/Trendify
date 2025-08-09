import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trendify_app/controller/home_controller.dart';
import 'package:trendify_app/view/widget/home/app_rounded_image.dart';
import 'package:trendify_app/view/widget/home/banner_dot_navigation.dart';
import '../../../core/constant/app_sizes.dart';

class PromoSlider extends StatelessWidget {
  PromoSlider({super.key, required this.banner});
  final controller = HomeControllerImp.instance;
  final List<String> banner;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller.carouselController,
          items: banner.map((ele) => AppRoundedImage(imageUrl: ele)).toList(),
          options: CarouselOptions(
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInOut,
            onPageChanged: (index, reason) =>
                controller.dotNavigationClick(index),
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        BannerDotNavigation(),
      ],
    );
  }
}
