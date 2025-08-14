import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/controller/cart_controller.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/button/elevated_button.dart';
import 'package:trendify_app/view/widget/product/app_product_title_text.dart';
import '../../widget/appbar/appbar.dart';
import '../../widget/cart/app_cart_item.dart';
import '../../widget/cart/app_product_quantity_add_remove.dart';

// ignore: must_be_immutable
class CartView extends StatelessWidget {
  CartView({super.key});
  CartControllerImp controller = Get.put(CartControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text("Cart")),
      bottomNavigationBar: Padding(
        padding: AppPadding.screenPadding,
        child: UElevatedButton(
          onPressed: () {
            controller.goToOrderReview();
          },
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
