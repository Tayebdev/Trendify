import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/controller/product/product_controller.dart';
import 'package:trendify_app/core/constant/app_link_api.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';
import 'package:trendify_app/view/widget/home/app_rounded_image.dart';
import 'package:trendify_app/view/widget/product/app_product_title_text.dart';
import 'package:trendify_app/view/widget/rounded_container/rounded_container.dart';
import '../../../controller/product/product_details_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../circular_icon/circular_icon.dart';

// ignore: must_be_immutable
class ProductCartVertical extends StatelessWidget {
  ProductCartVertical({super.key, this.index});
  static final controller = ProductControllerImp.instance;
  int? index;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        if (Get.isRegistered<ProductDetailsControllerImp>()) {
          Get.delete<ProductDetailsControllerImp>();
        }
        controller.goToDetailsProduct(controller.productList[index!].sId!);
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        //margin: EdgeInsets.symmetric(horizontal: AppSizes.xs,vertical: AppSizes.md),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.1),
              spreadRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
        ),
        child: Column(
          children: [
            AppRoundedContainer(
              height: 210,
              width: 180,
              padding: EdgeInsets.all(AppSizes.sm),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: AppRoundedImage(
                      imageUrl:
                          "${AppLinkApi.imageProduct}/${controller.productList[index!].images![0].image}",
                      isNetworkImage: true,
                    ),
                  ),
                  Positioned(
                    top: 12.0,
                    child: AppRoundedContainer(
                      radius: AppSizes.sm,
                      backgroundColor: AppColors.yellow,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm,
                        vertical: AppSizes.xs,
                      ),
                      child: Text(
                        '${controller.productList[index!].sold} %',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: AppColors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Obx(() {
                      final isFav = controller.isFavorite(
                        controller.productList[index!].sId.toString(),
                      );
                      return AppCircularIcon(
                        color: controller.productList[index!].isFavorite == true
                            ? AppColors.error
                            : isFav
                            ? AppColors.error
                            : dark
                            ? AppColors.light
                            : AppColors.dark,
                        icon: controller.productList[index!].isFavorite == true
                            ? Icons.favorite
                            : isFav
                            ? Icons.favorite
                            : Iconsax.heart,
                        onPressed: () => controller.toggleFavorite(
                          controller.productList[index!].sId.toString(),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm / 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppProductTitleText(
                    title: "${controller.productList[index!].title}",
                    smallSize: true,
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        controller.productList[index!].brand?.name ?? '',
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: AppSizes.xs),
                      Icon(
                        Iconsax.verify5,
                        color: AppColors.primary,
                        size: AppSizes.iconXs,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " \$${controller.productList[index!].priceAfterDiscount}",
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(width: AppSizes.sm / 8),
                      Text(
                        "\$${controller.productList[index!].price} ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2,
                          decorationColor: dark
                              ? AppColors.light
                              : AppColors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: AppSizes.sm),
                      Container(
                        width: AppSizes.iconLg * 1.2,
                        height: AppSizes.iconLg * 1.2,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              AppSizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Iconsax.add, color: AppColors.light),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
