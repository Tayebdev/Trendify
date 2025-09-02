// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/class/status_request.dart';
import 'package:trendify_app/core/constant/app_link_api.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../shimmer/category_shimmer.dart';
import 'app_vertical_image_text.dart';

class AppCategoryHome extends StatelessWidget {
  const AppCategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.popularCategories,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: AppColors.white),
          ),
          SizedBox(height: AppSizes.spaceBtwItems),
          GetBuilder<HomeControllerImp>(
            builder: (controller) =>
                controller.statusRequest == StatusRequest.loading
                ? AppCategoryShimmer()
                : SizedBox(
                    height: 90,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(width: AppSizes.spaceBtwItems),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categoryList.length,
                      itemBuilder: (context, index) {
                        return AppVerticalImageText(
                          title: "${controller.categoryList[index].nameAr}",
                          isAsset: false,
                          image:
                              '${AppLinkApi.imageCategory}/${controller.categoryList[index].image}',
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.subCetgory,
                              arguments: {
                                "categoryId":
                                    controller.categoryList[index].sId,
                                "nameCategory":
                                    controller.categoryList[index].name,
                              },
                            );
                          },
                          textColor: AppColors.white,
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
