import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/controller/home_controller.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/constant/app_texts.dart';
import '../widget/home/app_category_home.dart';
import '../widget/home/app_primary_header_container.dart';
import '../widget/home/appbar_home.dart';
import '../widget/home/promo_slider.dart';
import '../widget/home/section_header.dart';
import '../widget/text_field/search_appbar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final controller = Get.put(HomeControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(height: AppSizes.primaryHeaderHight),
              AppPrimaryHeaderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [AppbarHome(), AppCategoryHome()],
                ),
              ),
              SearchAppbar(),
            ],
          ),
          SizedBox(height: AppSizes.defaultSpace / 2),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.defaultSpace,
            ),
            child: Column(
              children: [
                PromoSlider(
                  banner: [
                    AppImages.homeBanner1,
                    AppImages.homeBanner2,
                    AppImages.homeBanner3,
                    AppImages.homeBanner4,
                    AppImages.homeBanner5,
                  ],
                ),
                SizedBox(height: AppSizes.defaultSpace / 2),
                SectionHeader(
                  title: AppTexts.popularCategories,
                  onPressed: () {},
                  textButton: AppTexts.viewAll,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
