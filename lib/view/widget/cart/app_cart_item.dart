import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trendify_app/core/constant/app_link_api.dart';
import '../../../controller/cart_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../utils/helpers/function_helpers.dart';
import '../home/app_rounded_image.dart';
import '../product/app_product_title_text.dart';
import '../store/brand_title_with_icon.dart';

// ignore: must_be_immutable
class AppCartItem extends StatelessWidget {
  int? index;
  AppCartItem({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      builder: (controller) => Row(
        children: [
          AppRoundedImage(
            isNetworkImage: true,
            imageUrl:
                "${AppLinkApi.imageProduct}/${controller.cartList[0].cartItems![index!].product!.images![0].image}",
            width: 60,
            height: 60,
            padding: EdgeInsets.all(AppSizes.sm),
            backgroundColor: AppHelperFunctions.isDarkMode(context)
                ? AppColors.darkerGrey
                : AppColors.light,
          ),
          SizedBox(width: AppSizes.spaceBtwItems),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BrandTitleWithIcon(
                  title:
                      "${controller.cartList[0].cartItems![index!].nameBrand}",
                ),
                Flexible(
                  child: AppProductTitleText(
                    title:
                        "${controller.cartList[0].cartItems![index!].product!.title}",
                    maxLines: 1,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Colors :',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text:
                            ' ${controller.cartList[0].cartItems![index!].product!.images![0].color}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      controller.cartList[0].cartItems![index!].size == " "
                          ? TextSpan()
                          : TextSpan(
                              text: '  Size : ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                      TextSpan(
                        text:
                            '${controller.cartList[0].cartItems![index!].size}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
