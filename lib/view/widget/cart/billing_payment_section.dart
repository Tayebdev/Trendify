import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/order_review_controller.dart';
import '../../../core/constant/app_sizes.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderReviewControllerImp>(
      builder: (controller) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sub Total", style: Theme.of(context).textTheme.bodyMedium),
              Text(
                "\$${OrderReviewControllerImp.controllerCart.cartList[0].totalCartPrice}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwItems / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Free",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "\$${OrderReviewControllerImp.controllerCart.cartList[0].totalCartPrice! - OrderReviewControllerImp.controllerCart.cartList[0].totalPriceAfterDiscount!}",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwItems / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery price",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwItems / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order Total",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "\$${OrderReviewControllerImp.controllerCart.cartList[0].totalPriceAfterDiscount! + 6.0}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
