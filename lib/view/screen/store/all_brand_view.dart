import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/appbar/appbar.dart';
import 'package:trendify_app/view/widget/home/section_header.dart';

import '../../../core/constant/app_images.dart';
import '../../widget/home/grid_layout.dart';
import '../../widget/store/brand_card.dart';

class AllBrandView extends StatelessWidget {
  const AllBrandView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(title: Text("Brands"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
              SectionHeader(title: "Brands", showButton: false),
              SizedBox(height: AppSizes.spaceBtwItems),
              GridLayout(
                mainAxisCount: 80,
                itemCount: 10,
                itemBuilder: (context, index) => BrandCard(
                  onTap: () {Get.toNamed(AppRoutes.brandProduct);},
                  imageUrl: AppImages.brand,
                  showBorder: true,
                  title: "Nike",
                  numberProduct: "172 Products",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
