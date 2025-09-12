import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/appbar/appbar.dart';
import '../../../controller/product/rate_product_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../widget/product/app_overall_product_rating.dart';
import '../../widget/product/app_rating_bar_indicator.dart';
import '../../widget/product/app_user_review_card.dart';
import 'rate_product_view.dart';

class ProductReviews extends StatelessWidget {
  ProductReviews({super.key});
  final controller = Get.put(RateProductControllerImp());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RateProductControllerImp>(
      builder: (controller) => HandleDataView(
        statusRequest: controller.statusRequest,
        widget: Scaffold(
          floatingActionButton: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            ),
            child: IconButton(
              onPressed: () {
                _showRateExperienceModal(context);
              },
              icon: Icon(Iconsax.message_text, color: Colors.white),
            ),
          ),
          appBar: UAppBar(
            showBackArrow: true,
            title: Text("Reviews & Ratings"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ratings and reviews are verified and are from people who use the same type of device that you use .",
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  AppOverallProductRating(),
                  AppRatingBarIndicator(rating: 3.5),
                  SizedBox(height: AppSizes.spaceBtwItems / 2),
                  Text("199,12", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  controller.reviewList.isEmpty
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 200),
                            child: Text("No reviews yet"),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.reviewList.length,
                          itemBuilder: (context, index) {
                            return AppUserReviewCard(index: index);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: AppSizes.sm);
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showRateExperienceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RateProductView(),
    );
  }
}
