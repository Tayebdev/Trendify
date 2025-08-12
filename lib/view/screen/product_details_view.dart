import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/view/widget/product/app_product_attribute.dart';
import 'package:trendify_app/view/widget/product/app_product_image_slider.dart';
import '../widget/product/app_product_meta.dart';
import '../widget/product/app_rating_and_share.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  AppProductAttribute()
                  
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
