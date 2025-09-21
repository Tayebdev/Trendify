import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import 'package:trendify_app/view/widget/home/section_header.dart';
import 'package:trendify_app/view/widget/product/app_product_attribute.dart';
import 'package:trendify_app/view/widget/product/app_product_image_slider.dart';
import '../../../controller/product/product_details_controller.dart';
import '../../widget/cart/bottom_add_to_cart.dart';
import '../../widget/product/app_product_meta.dart';
import '../../widget/product/app_rating_and_share.dart';

// ignore: must_be_immutable
class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final String productId = Get.arguments['productId'] as String;
    if (!Get.isRegistered<ProductDetailsControllerImp>(tag: productId)) {
      Get.put(ProductDetailsControllerImp(), tag: productId);
    }
    final controller = Get.find<ProductDetailsControllerImp>(tag: productId);
    return GetBuilder<ProductDetailsControllerImp>(
      init: controller,
      builder: (controller) => HandleDataView(
        statusRequest: controller.statusRequest,
        widget: Scaffold(
          bottomNavigationBar: BottomAddToCart(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                AppProductImageSlider(),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppSizes.defaultSpace,
                    bottom: AppSizes.defaultSpace,
                    right: AppSizes.defaultSpace,
                  ),
                  child: Column(
                    children: [
                      AppRatingAndShare(),
                      AppProductMeta(),
                      AppProductAttribute(),
                      SizedBox(height: AppSizes.spaceBtwSections / 2),
                      SectionHeader(title: 'Description', showButton: false),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      ReadMoreText(
                        controller.product?.description ??
                            "No description available",
                        trimLines: 2,
                        trimCollapsedText: " Show more",
                        trimExpandedText: " Less",
                        trimMode: TrimMode.Line,
                        moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                        ),
                        lessStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                        ),
                      ),
                      //SizedBox(height: AppSizes.spaceBtwItems),
                      Divider(),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      SectionHeader(
                        title:
                            'Reviews (${controller.product?.quantityResidents})',
                        textButton: 'View all',
                        onPressed: () {
                          controller.goToReviewsProduct();
                        },
                      ),
                      //SizedBox(height: AppSizes.spaceBtwSections/2),
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
