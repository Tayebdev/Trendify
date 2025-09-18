import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/controller/wish_list_controller.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_failure.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/appbar/appbar.dart';
import '../../controller/product/product_controller.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/constant/app_sizes.dart';
import '../../utils/helpers/function_helpers.dart';
import '../widget/circular_icon/circular_icon.dart';
import '../widget/home/app_rounded_image.dart';
import '../widget/home/grid_layout.dart';
import '../widget/product/app_product_title_text.dart';
import '../widget/rounded_container/rounded_container.dart';

class WishListView extends StatelessWidget {
  WishListView({super.key});
  final productController = Get.put(ProductControllerImp());

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    Get.put(WishListControllerImp());

    return Scaffold(
      appBar: UAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [AppCircularIcon(icon: Iconsax.add, onPressed: () {})],
      ),
      body: GetBuilder<WishListControllerImp>(
        builder: (controller) => HandleDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.screenPadding,
              child: controller.favoriteList.isEmpty
                  ? Padding(
                    padding: const EdgeInsets.only(top: AppSizes.spaceBtwItems*8),
                    child: AppFailure(
                        title: "No favorites yet",
                        subtitle:
                            "Looks like your wishlist is empty. Add some \n products you love!",
                      ),
                  )
                  : GridLayout(
                      itemCount: controller.favoriteList.length,
                      mainAxisCount: 300,
                      itemBuilder: (context, index) {
                        final fav = controller.favoriteList[index].product!;
                        return GestureDetector(
                          onTap: () => controller.goToDetailsProduct(fav.sId!),
                          child: Container(
                            width: 180,
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.1,
                                  ),
                                  spreadRadius: 7,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(
                                AppSizes.productImageRadius,
                              ),
                            ),
                            child: Column(
                              children: [
                                AppRoundedContainer(
                                  height: 210,
                                  width: 180,
                                  padding: EdgeInsets.all(AppSizes.sm),
                                  backgroundColor: dark
                                      ? AppColors.dark
                                      : AppColors.light,
                                  child: Stack(
                                    children: [
                                      /// product image
                                      Padding(
                                        padding: const EdgeInsets.only(top: 50),
                                        child: AppRoundedImage(
                                          imageUrl:
                                              "${AppLinkApi.imageProduct}/${fav.images![0].image}",
                                          isNetworkImage: true,
                                        ),
                                      ),

                                      /// discount label
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
                                            '${fav.sold} %',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .apply(color: AppColors.black),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Obx(() {
                                          final isFav = productController
                                              .isFavorite(fav.sId!);
                                          return AppCircularIcon(
                                            color: isFav
                                                ? AppColors.error
                                                : dark
                                                ? AppColors.light
                                                : AppColors.dark,
                                            icon: isFav
                                                ? Icons.favorite
                                                : Iconsax.heart,
                                            onPressed: () => productController
                                                .toggleFavorite(fav.sId!),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: AppSizes.spaceBtwItems / 2),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: AppSizes.sm / 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppProductTitleText(
                                        title: fav.title!,
                                        smallSize: true,
                                      ),
                                      SizedBox(
                                        height: AppSizes.spaceBtwItems / 2,
                                      ),

                                      Row(
                                        children: [
                                          Text(
                                            'Apple',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.labelMedium,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$${fav.priceAfterDiscount}",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.headlineSmall,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(width: AppSizes.sm / 8),
                                          Text(
                                            "\$${fav.price} ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough,
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
                                                topLeft: Radius.circular(
                                                  AppSizes.cardRadiusMd,
                                                ),
                                                bottomRight: Radius.circular(
                                                  AppSizes.productImageRadius,
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Iconsax.add,
                                                  color: AppColors.light,
                                                ),
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
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
