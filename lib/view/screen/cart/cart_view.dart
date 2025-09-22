import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/controller/cart_controller.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_failure.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/button/elevated_button.dart';
import 'package:trendify_app/view/widget/product/app_product_title_text.dart';
import '../../widget/appbar/appbar.dart';
import '../../widget/cart/app_cart_item.dart';
import '../../widget/cart/app_product_quantity_add_remove.dart';

// ignore: must_be_immutable
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartControllerImp());

    return GetBuilder<CartControllerImp>(
      builder: (_) {
        if (controller.cartList.isEmpty) {
          return Scaffold(
            appBar: UAppBar(showBackArrow: true, title: Text("Cart")),
            body: AppFailure(
              title: "Your cart is empty",
              subtitle: "Add some products to your cart to see them here.",
            ),
          );
        }

        return HandleDataView(
          statusRequest: controller.statusRequest,
          widget: Scaffold(
            appBar: UAppBar(showBackArrow: true, title: Text("Cart")),
            bottomNavigationBar: Padding(
              padding: AppPadding.screenPadding,
              child: UElevatedButton(
                onPressed: () {
                  controller.goToOrderReview();
                },
                child: Text(
                  "Checkout : \$${controller.cartList[0].totalPriceAfterDiscount ?? 0}",
                ),
              ),
            ),
            body: Padding(
              padding: AppPadding.screenPadding,
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSizes.spaceBtwSections),
                itemCount: controller.cartList[0].cartItems?.length ?? 0,
                itemBuilder: (context, index) {
                  final cartItem = controller.cartList[0].cartItems![index];
                  return Column(
                    children: [
                      AppCartItem(index: index),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 80),
                              AppProductQuantityAddRemove(index: index),
                            ],
                          ),
                          AppProductTitleText(
                            title:
                                "\$${(cartItem.price ?? 0) * (cartItem.quantity ?? 0)}",
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
