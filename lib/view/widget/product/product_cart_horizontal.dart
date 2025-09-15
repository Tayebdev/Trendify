import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_link_api.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/data/model/product_model.dart';
import '../../../controller/sub_category_controller.dart';
import '../../../utils/helpers/function_helpers.dart';
import '../home/app_rounded_image.dart';
import '../rounded_container/rounded_container.dart';
import '../store/brand_title_with_icon.dart';
import 'app_product_title_text.dart';
import 'product_card_add_to_cart_button.dart';

// ignore: must_be_immutable
class AppProductCardHorizontal extends StatelessWidget {
  AppProductCardHorizontal({super.key, this.productModel});

  ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return GetBuilder<SubCategoryControllerImp>(
      builder: (controller) => GestureDetector(
        onTap: () =>
            controller.goToDetailsProduct(productModel!.sId.toString()),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
            color: dark ? AppColors.darkerGrey : AppColors.grey,
          ),
          child: Row(
            children: [
              AppRoundedContainer(
                height: 120,
                padding: const EdgeInsets.all(AppSizes.sm),
                backgroundColor: dark ? AppColors.dark : AppColors.light,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Center(
                          child: AppRoundedImage(
                            isNetworkImage: true,
                            imageUrl:
                                "${AppLinkApi.imageProduct}/${productModel!.images![0].image}",
                            applayImageRadius: true,
                          ),
                        ),
                      ),
                    ),
                    AppRoundedContainer(
                      radius: AppSizes.sm,
                      // ignore: deprecated_member_use
                      backgroundColor: AppColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm,
                        vertical: AppSizes.xs,
                      ),
                      child: Text(
                        '${productModel!.sold}%',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: AppColors.black),
                      ),
                    ),
                    Positioned(right: 0, top: 0, child: Icon(Iconsax.heart)),
                  ],
                ),
              ),
              SizedBox(
                width: 162,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppSizes.sm,
                    left: AppSizes.sm,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppProductTitleText(
                        title: "${productModel!.title}",
                        smallSize: true,
                      ),
                      const SizedBox(height: AppSizes.spaceBtwItems),
                      BrandTitleWithIcon(title: "Nike"),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Price
                          Flexible(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: AppSizes.sm / 4,
                                  ),
                                  child: Text(
                                    "\$${productModel!.priceAfterDiscount} ",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: AppSizes.sm / 4,
                                  ),
                                  child: Text(
                                    "\$${productModel!.price}",
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationThickness:
                                              2, // thickness of the line
                                          decorationColor: dark
                                              ? AppColors.light
                                              : AppColors
                                                    .black, // color of the line
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ProductCardAddToCartButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
