import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lottie/lottie.dart';
import 'package:trendify_app/controller/sub_category_controller.dart';
import 'package:trendify_app/core/class/status_request.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
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
      builder: (controller) => HandleDataView(
        statusRequest: controller.statusRequest,
        widget: Scaffold(
          appBar: UAppBar(
            showBackArrow: true,
            title: Text(controller.categoryName),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.screenPadding,
              child: Column(
                children: [
                  /// Banner
                  AppRoundedImage(
                    imageUrl: AppImages.homeBanner3,
                    applayImageRadius: true,
                    width: double.infinity,
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  if (controller.statusRequest == StatusRequest.failure)
                    AppFailure(
                      title: "No ${controller.categoryName} Found!",
                      subtitle:
                          "Currently, there are no products available in the ${controller.categoryName} category. Please check back later.",
                    )
                  else
                    Column(
                      children: List.generate(controller.subCategoryList.length, (
                        i,
                      ) {
                        if (i >= controller.allListProduct.length) {
                          return Column(
                            children: [
                              SectionHeader(
                                title: controller.subCategoryList[i].name ?? "",
                                textButton: "View all",
                                onPressed: () {},
                              ),
                              Lottie.asset(
                                AppImages.loadingAnimation,
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: AppSizes.spaceBtwSections / 4),
                            ],
                          );
                        }
                        if (controller.allListProduct[i].isEmpty) {
                          return Column(
                            children: [
                              SectionHeader(
                                title: controller.subCategoryList[i].name ?? "",
                                textButton: "View all",
                                onPressed: () {},
                              ),
                              AppFailure(
                                title:
                                    "No ${controller.subCategoryList[i].name}",
                                subtitle:
                                    "There are no products in this ${controller.subCategoryList[i].name} yet.",
                              ),
                              SizedBox(height: AppSizes.spaceBtwSections / 4),
                            ],
                          );
                        }
                        return Column(
                          children: [
                            SectionHeader(
                              title: controller.subCategoryList[i].name ?? "",
                              textButton: "View all",
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: 120,
                              child: ListView.separated(
                                itemCount: controller.allListProduct[i].length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final product =
                                      controller.allListProduct[i][index];
                                  return AppProductCardHorizontal(
                                    productModel: product,
                                  );
                                },
                                separatorBuilder: (_, _) =>
                                    SizedBox(width: AppSizes.spaceBtwItems),
                              ),
                            ),
                            SizedBox(height: AppSizes.spaceBtwSections / 4),
                          ],
                        );
                      }),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
