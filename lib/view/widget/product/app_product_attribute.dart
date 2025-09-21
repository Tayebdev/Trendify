import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trendify_app/core/class/status_request.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_loading.dart';
import 'package:trendify_app/view/widget/choice_chip/app_choice_chip.dart';
import 'package:trendify_app/view/widget/home/section_header.dart';

import '../../../controller/product/product_details_controller.dart';

class AppProductAttribute extends StatelessWidget {
  const AppProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? AppLoading()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                SectionHeader(title: "Colors", showButton: false),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                Column(
                  children: [
                    Wrap(
                      spacing: 8,
                      children: [
                        for (
                          int i = 0;
                          i < (controller.product?.images?.length ?? 0);
                          i++
                        )
                          Obx(
                            () => AppChoiceChip(
                              text: '${controller.product?.images![i].color}',
                              selected: controller.item.value == i,
                              onSelected: (value) {
                                controller.changeSelectedIndex(i);
                              },
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                controller.product!.sizes!.isEmpty
                    ? SizedBox()
                    : SectionHeader(title: "Sizes", showButton: false),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                Column(
                  children: [
                    Wrap(
                      spacing: 8,
                      children: [
                        for (
                          int i = 0;
                          i < (controller.product?.sizes?.length ?? 0);
                          i++
                        )
                          Obx(
                            () => AppChoiceChip(
                              text: '${controller.product?.sizes![i]}',
                              selected: i == controller.itemSize.value,
                              onSelected: (value) {
                                controller.changeSelectedSize(i);
                              },
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
