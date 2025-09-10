import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/controller/home_controller.dart';
import 'package:trendify_app/controller/product/product_controller.dart';
import 'package:trendify_app/core/class/status_request.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/constant/app_texts.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_failure.dart';
import '../../widget/home/app_category_home.dart';
import '../../widget/home/app_primary_header_container.dart';
import '../../widget/home/appbar_home.dart';
import '../../widget/home/grid_layout.dart';
import '../../widget/home/promo_slider.dart';
import '../../widget/home/section_header.dart';
import '../../widget/product/product_cart_vertical.dart';
import '../../widget/text_field/search_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    Get.put(ProductControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => HandleDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
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
                        title: AppTexts.popularProducts,
                        onPressed: () {
                          controller.goToAllProduct();
                        },
                        textButton: AppTexts.viewAll,
                      ),
                      SizedBox(height: AppSizes.spaceBtwItems / 2),
                      GetBuilder<ProductControllerImp>(
                        builder: (controller) =>
                            controller.statusRequest == StatusRequest.failure
                            ? AppFailure(
                                title: "No Product Found!",
                                subtitle:
                                    "Currently, there are no popular products available. Please check back later.",
                              )
                            : GridLayout(
                                itemCount: controller.productList.length,
                                mainAxisCount: 300,
                                itemBuilder: (context, index) =>
                                    ProductCartVertical(index: index),
                              ),
                      ),
                      SizedBox(height: AppSizes.spaceBtwItems,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
