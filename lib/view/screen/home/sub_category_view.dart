import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trendify_app/controller/sub_category_controller.dart';
import 'package:trendify_app/core/class/status_request.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_failure.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/home/app_rounded_image.dart';
import 'package:trendify_app/view/widget/home/section_header.dart';

import '../../widget/appbar/appbar.dart';
import '../../widget/product/product_cart_horizontal.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SubCategoryControllerImp(),
      builder: (controller) => Scaffold(
        appBar: UAppBar(
          showBackArrow: true,
          title: Text(controller.categoryName),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: Column(
              children: [
                AppRoundedImage(
                  imageUrl: AppImages.homeBanner3,
                  applayImageRadius: true,
                  width: double.infinity,
                ),
                SizedBox(height: AppSizes.spaceBtwSections),
                if (controller.statusRequest == StatusRequest.failure) ...[
                  AppFailure(
                    title: "No ${controller.categoryName} Found!",
                    subtitle:
                        "Currently, there are no products available in the ${controller.categoryName} category. Please check back later.",
                  ),
                ] else ...[
                  for (var subCategory in controller.subCategoryList) ...[
                    SectionHeader(
                      title: subCategory.name ?? "",
                      textButton: "View all",
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const AppProductCardHorizontal();
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: AppSizes.spaceBtwItems),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwSections),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
