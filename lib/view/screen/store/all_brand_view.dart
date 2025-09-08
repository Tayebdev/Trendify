import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/appbar/appbar.dart';
import 'package:trendify_app/view/widget/home/section_header.dart';

import '../../../controller/store_controller.dart';
import '../../../core/constant/app_link_api.dart';
import '../../widget/home/grid_layout.dart';
import '../../widget/store/brand_card.dart';

class AllBrandView extends StatelessWidget {
  const AllBrandView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StoreControllerImp());
    return Scaffold(
      appBar: UAppBar(title: Text("Brands"), showBackArrow: true),
      body: GetBuilder<StoreControllerImp>(
        builder: (controller) => HandleDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.screenPadding,
              child: Column(
                children: [
                  SectionHeader(title: "All Brands", showButton: false),
                  SizedBox(height: AppSizes.spaceBtwItems / 2),
                  GridLayout(
                    mainAxisCount: 70,
                    itemCount: controller.brandList.length,
                    itemBuilder: (context, index) => BrandCard(
                      onTap: () {
                        Get.toNamed(AppRoutes.brandProduct);
                      },
                      imageUrl:
                          "${AppLinkApi.imageBrand}/${controller.brandList[index].image}",
                      showBorder: true,
                      title: "${controller.brandList[index].name}",
                      numberProduct: "172 Products",
                    ),
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
