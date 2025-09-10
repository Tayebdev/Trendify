import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_link_api.dart';
import 'package:trendify_app/view/widget/image_widget/circular_image.dart';
import 'package:trendify_app/view/widget/product/app_product_title_text.dart';
import '../../../controller/product/product_details_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../rounded_container/rounded_container.dart';
import '../store/brand_title_with_icon.dart';

class AppProductMeta extends StatelessWidget {
  const AppProductMeta({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppRoundedContainer(
                radius: AppSizes.sm,
                backgroundColor: AppColors.yellow,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: AppSizes.xs,
                ),
                child: Text(
                  '${controller.product?.sold}%',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.apply(color: AppColors.black),
                ),
              ),
              SizedBox(width: AppSizes.spaceBtwItems),
              Text(
                "\$${controller.product?.price}",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.white,
                ),
              ),
              SizedBox(width: AppSizes.spaceBtwItems),
              Text(
                "\$${controller.product?.priceAfterDiscount}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwItems / 1.5),
          Row(
            children: [
              AppProductTitleText(title: "Title :"),
              SizedBox(width: AppSizes.xs),
              Text(
                " ${controller.product?.title}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwItems / 1.5),
          Row(
            children: [
              AppProductTitleText(title: "Status :"),
              SizedBox(width: AppSizes.xs),
              (controller.product?.quantity != null &&
                      controller.product!.quantity! > 0)
                  ? Text(
                      " In Stock",
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  : Text(
                      "Not In Stock",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwItems / 1.5),
          Row(
            children: [
              AppCircularImage(
                image: controller.product?.brand?.image != null
                    ? "${AppLinkApi.imageBrand}/${controller.product!.brand!.image}"
                    : AppImages.brand,
                isNetworkImage: controller.product?.brand?.image != null,
                width: 62,
                height: 62,
              ),
              SizedBox(width: AppSizes.sm),
              BrandTitleWithIcon(title: "${controller.product?.brand!.name}"),
            ],
          ),
        ],
      ),
    );
  }
}
