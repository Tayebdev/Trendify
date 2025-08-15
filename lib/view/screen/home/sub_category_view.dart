import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/home/app_rounded_image.dart';
import 'package:trendify_app/view/widget/home/section_header.dart';

import '../../widget/appbar/appbar.dart';
import '../../widget/product/product_cart_horizontal.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text("Sports")),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
              AppRoundedImage(
                imageUrl: AppImages.homeBanner3,
                applayImageRadius: true,
                width: double.infinity,
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              Column(
                children: [
                  SectionHeader(
                    title: "Sports shirts",
                    textButton: "View all",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AppProductCardHorizontal();
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: AppSizes.spaceBtwItems),
                    ),
                  ),
                  SectionHeader(
                    title: "Track suits ",
                    textButton: "View all",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AppProductCardHorizontal();
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: AppSizes.spaceBtwItems),
                    ),
                  ),
                  SectionHeader(
                    title: "Sports Shoes",
                    textButton: "View all",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AppProductCardHorizontal();
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: AppSizes.spaceBtwItems),
                    ),
                  ),
                   SectionHeader(
                    title: "Sports Shoes",
                    textButton: "View all",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AppProductCardHorizontal();
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: AppSizes.spaceBtwItems),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
