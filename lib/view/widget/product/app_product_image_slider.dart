import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_link_api.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import '../../../controller/product/product_details_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../utils/helpers/function_helpers.dart';
import '../appbar/appbar.dart';
import '../circular_icon/circular_icon.dart';
import '../home/app_rounded_image.dart';
import '../setting/app_curved_edges_widget.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return GetBuilder<ProductDetailsControllerImp>(
      builder: (controller) => HandleDataView(
        statusRequest: controller.statusRequest,
        widget: AppCurvedEdgesWidget(
          child: Container(
            color: dark ? AppColors.darkerGrey : AppColors.light,
            child: Stack(
              children: [
                SizedBox(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      AppSizes.productImageRadius * 2,
                    ),
                    child: Center(
                      child: Obx(() {
                        return Image.network(
                          "${AppLinkApi.imageProduct}/${controller.product!.images![controller.item.value].image}",
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(AppImages.product);
                          },
                        );
                      }),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 30,
                  left: AppSizes.defaultSpace,
                  child: SizedBox(
                    height: 80,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => controller.changeSelectedIndex(index),
                          child: Obx(
                            () => AppRoundedImage(
                              isNetworkImage: true,
                              imageUrl:
                                  "${AppLinkApi.imageProduct}/${controller.product!.images![index].image}",
                              width: 80,
                              backgroundColor: dark
                                  ? AppColors.dark
                                  : AppColors.light,
                              border: Border.all(
                                color: controller.item.value == index
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 2,
                              ),
                              padding: EdgeInsets.all(AppSizes.sm),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: AppSizes.spaceBtwItems),
                      itemCount: controller.product?.images?.length ?? 0,
                    ),
                  ),
                ),
                UAppBar(
                  showBackArrow: true,
                  actions: [
                    AppCircularIcon(
                      icon: Iconsax.heart,
                      color: dark ? AppColors.light : AppColors.dark,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
