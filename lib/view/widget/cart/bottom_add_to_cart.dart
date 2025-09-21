import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';
import 'package:trendify_app/view/widget/circular_icon/circular_icon.dart';

import '../../../controller/cart_controller.dart';
import '../../../controller/product/product_details_controller.dart';

class BottomAddToCart extends StatelessWidget {
  BottomAddToCart({super.key});

  final CartControllerImp cartController = Get.put(
    CartControllerImp(),
    permanent: false,
  );
  final ProductDetailsControllerImp productController =
      Get.find<ProductDetailsControllerImp>(tag: Get.arguments['productId']);

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace,
        vertical: AppSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? AppColors.darkerGrey : AppColors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.cardRadiusLg),
          topRight: Radius.circular(AppSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Quantity Selector
          Obx(
            () => Row(
              children: [
                AppCircularIcon(
                  onPressed: cartController.decreaseCartItemQuantity,
                  icon: Iconsax.minus,
                  backgroundColor: AppColors.darkGrey,
                  color: AppColors.white,
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: AppSizes.spaceBtwItems),
                Text(
                  "${cartController.quantitySelected}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(width: AppSizes.spaceBtwItems),
                AppCircularIcon(
                  onPressed: cartController.increaseCartItemQuantity,
                  icon: Iconsax.add,
                  backgroundColor: cartController.quantitySelected.value == 1
                      ? AppColors.dark
                      : AppColors.primary,
                  color: AppColors.white,
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: AppSizes.spaceBtwItems),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              cartController.addProductToCart(
                productController.color.value,
                productController.size.value,
                productController.product!.sId!,
                resetSelection: () {
                  productController.color.value =
                      productController.product!.images![0].color!;
                  productController.size.value =
                      productController.product!.sizes![0];
                  productController.item.value = 0;
                  productController.itemSize.value = 0;
                },
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(AppSizes.md),
              backgroundColor: AppColors.primary,
              side: BorderSide(color: AppColors.primary),
            ),
            child: Row(
              children: [
                Icon(Iconsax.shop_add, size: AppSizes.iconSm + 2),
                SizedBox(width: AppSizes.sm),
                Text("Add to Cart"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
