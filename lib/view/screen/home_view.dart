import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/controller/home_controller.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/constant/app_texts.dart';
import '../widget/home/app_category_home.dart';
import '../widget/home/app_primary_header_container.dart';
import '../widget/home/appbar_home.dart';
import '../widget/home/grid_layout.dart';
import '../widget/home/promo_slider.dart';
import '../widget/home/section_header.dart';
import '../widget/product/product_cart_vertical.dart';
import '../widget/text_field/search_appbar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final controller = Get.put(HomeControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: AppSizes.homeprimaryHeaderHight),
                AppHomePrimaryHeaderContainer(
                  height: AppSizes.homePrimaryHeaderHeight,
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
                  SizedBox(height: AppSizes.defaultSpace / 4),
                  SectionHeader(
                    title: AppTexts.popularCategories,
                    onPressed: () {},
                    textButton: AppTexts.viewAll,
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems / 2),
                  GridLayout(
                    itemCount: 10,
                    mainAxisCount: 261.5,
                    itemBuilder: (context, index) => ProductCartVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
