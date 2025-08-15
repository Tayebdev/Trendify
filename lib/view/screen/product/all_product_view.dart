import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/appbar/appbar.dart';
import 'package:trendify_app/view/widget/home/grid_layout.dart';
import 'package:trendify_app/view/widget/product/product_cart_vertical.dart';

class AllProductView extends StatelessWidget {
  const AllProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(title: Text("Popular Products"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
              DropdownButtonFormField(
                items:
                    [
                          "Name",
                          "Higher Price",
                          "Lower Price",
                          "Sale",
                          "Newest",
                          "Popularity",
                        ]
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                onChanged: (value) {},
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              GridLayout(
                mainAxisCount: 261.5,
                itemCount: 10,
                itemBuilder: (context, index) => ProductCartVertical(),
              ),
              SizedBox(height: AppSizes.spaceBtwSections / 2),
            ],
          ),
        ),
      ),
    );
  }
}
