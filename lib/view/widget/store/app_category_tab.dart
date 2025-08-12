import 'package:flutter/material.dart';

import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../home/grid_layout.dart';
import '../home/section_header.dart';
import '../product/product_cart_vertical.dart';
import 'app_brand_show_case.dart';

class AppCategoryTab extends StatelessWidget {
  const AppCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: AppSizes.defaultSpace,
          ),
          child: Column(
            children: [
              AppBrandShowCase(),
              AppBrandShowCase(),
              SectionHeader(
                title: AppTexts.youMightLike,
                onPressed: () {},
                textButton: AppTexts.viewAll,
              ),
              GridLayout(
                itemCount: 10,
                mainAxisCount: 261.5,
                itemBuilder: (context, index) => ProductCartVertical(),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwSections),
      ],
    );
  }
}
