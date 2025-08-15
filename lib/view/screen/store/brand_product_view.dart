import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/appbar/appbar.dart';
import '../../../core/constant/app_images.dart';
import '../../widget/product/app_sortable_product.dart';
import '../../widget/store/brand_card.dart';

class BrandProductView extends StatelessWidget {
  const BrandProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        title: Text("Nike", style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
              BrandCard(
                width: double.infinity,
                onTap: () {},
                imageUrl: AppImages.brand,
                numberProduct: "172 product",
                title: "Bata",
              ),
              SizedBox(height: AppSizes.spaceBtwItems),
              AppSortableProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
