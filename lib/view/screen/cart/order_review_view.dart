import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/controller/order_review_controller.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/helpers/function_helpers.dart';
import '../../widget/button/elevated_button.dart';
import '../../widget/rounded_container/rounded_container.dart';
import '../../../core/constant/app_sizes.dart';
import '../../widget/appbar/appbar.dart';
import '../../widget/cart/app_cart_item.dart';
import '../../widget/cart/billing_address_section.dart';
import '../../widget/cart/billing_amount_section.dart';
import '../../widget/cart/billing_payment_section.dart';
import 'coupon_code.dart';

// ignore: must_be_immutable
class OrderReviewView extends StatelessWidget {
  OrderReviewView({super.key});
  OrderReviewControllerImp controller = Get.put(OrderReviewControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: AppPadding.screenPadding,
        child: UElevatedButton(
          onPressed: () {
            controller.goToPaymentSuccess();
          },
          child: Text("Checkout : \$256"),
        ),
      ),
      appBar: UAppBar(showBackArrow: true, title: Text("Order Review")),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSizes.spaceBtwSections / 2),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return AppCartItem();
                },
              ),
              SizedBox(height: AppSizes.spaceBtwSections / 2),
              CouponCode(),
              SizedBox(height: AppSizes.spaceBtwSections / 2),
              AppRoundedContainer(
                padding: EdgeInsets.all(AppSizes.md),
                showBorder: true,
                backgroundColor: AppHelperFunctions.isDarkMode(context)
                    ? AppColors.black
                    : AppColors.white,
                child: Column(
                  children: [
                    BillingPaymentSection(),
                    SizedBox(height: AppSizes.spaceBtwItems / 4),
                    Divider(),
                    SizedBox(height: AppSizes.spaceBtwItems / 4),
                    BillingAmountSection(),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
