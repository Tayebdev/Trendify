import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/button/elevated_button.dart';
import 'package:trendify_app/view/widget/product/app_product_title_text.dart';
import '../../widget/appbar/appbar.dart';
import '../../widget/cart/app_cart_item.dart';
import '../../widget/cart/app_product_quantity_add_remove.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text("Cart")),
      bottomNavigationBar: Padding(
        padding: AppPadding.screenPadding,
        child: UElevatedButton(
          onPressed: () {},
          child: Text("Checkout : \$256"),
        ),
      ),
      body: Padding(
        padding: AppPadding.screenPadding,
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) =>
              SizedBox(height: AppSizes.spaceBtwSections),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                AppCartItem(),
                SizedBox(height: AppSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 80),
                        AppProductQuantityAddRemove(),
                      ],
                    ),
                    AppProductTitleText(title: "\$256"),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
