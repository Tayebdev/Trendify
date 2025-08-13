import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/view/widget/home/section_header.dart';
import 'package:trendify_app/view/widget/product/app_product_attribute.dart';
import 'package:trendify_app/view/widget/product/app_product_image_slider.dart';
import '../widget/button/elevated_button.dart';
import '../widget/cart/bottom_add_to_cart.dart';
import '../widget/product/app_product_meta.dart';
import '../widget/product/app_rating_and_share.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SizedBox(height: AppSizes.spaceBtwSections),
                  UElevatedButton(child: Text("Checkout"), onPressed: () {}),
                  SizedBox(height: AppSizes.spaceBtwSections / 2),
                  SectionHeader(title: 'Description', showButton: false),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  ReadMoreText(
                    "Stay fresh in style with this classic Nike T-shirt.Crafted from premium cotton for all-day comfort.Iconic swoosh logo adds a sporty edge.Perfect for workouts or casual wear.",
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
                  SectionHeader(title: 'Reviews (199)', textButton: 'View all'),
                  //SizedBox(height: AppSizes.spaceBtwSections/2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
