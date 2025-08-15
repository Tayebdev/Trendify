import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/controller/store_controller.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';
import '../../widget/home/section_header.dart';
import '../../widget/store/App_store_header.dart';
import '../../widget/store/app_category_tab.dart';
import '../../widget/store/app_tab_bar.dart';
import '../../widget/store/brand_card.dart';

// ignore: must_be_immutable
class StoreView extends StatelessWidget {
  StoreView({super.key});
  StoreControllerImp controller = Get.put(StoreControllerImp());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 320,
                pinned: true,
                floating: false,
                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppStoreHeader(),
                      SizedBox(height: AppSizes.spaceBtwItems / 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.defaultSpace,
                        ),
                        child: Column(
                          children: [
                            SectionHeader(
                              title: AppTexts.brand,
                              onPressed: () {
                                controller.goToAllBrands();
                              },
                              textButton: AppTexts.viewAll,
                            ),
                            SizedBox(
                              height: AppSizes.brandCardHeight,
                              child: ListView.separated(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return BrandCard(
                                    onTap: () {},
                                    imageUrl: AppImages.brand,
                                    numberProduct: "172 product",
                                    title: "Bata",
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                      return SizedBox(
                                        width: AppSizes.spaceBtwItems / 2,
                                      );
                                    },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //
                bottom: AppTabBar(
                  lisTab: [
                    Text('Electronics'),
                    Text('Smartphones'),
                    Text('Laptops'),
                    Text('Cameras'),
                    Text('Fashion'),
                    Text('Shoes'),
                    Text('Electronics'),
                    Text('Smartphones'),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              AppCategoryTab(),
              AppCategoryTab(),
              AppCategoryTab(),
              AppCategoryTab(),
              AppCategoryTab(),
              AppCategoryTab(),
              AppCategoryTab(),
              AppCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
