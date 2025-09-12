import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:trendify_app/core/constant/app_link_api.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';
import '../../../controller/product/rate_product_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../rounded_container/rounded_container.dart';
import 'app_rating_bar_indicator.dart';

// ignore: must_be_immutable
class AppUserReviewCard extends StatelessWidget {
  AppUserReviewCard({super.key, this.index});
  int? index;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return GetBuilder<RateProductControllerImp>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "${AppLinkApi.imageUser}/${controller.reviewList[index!].user!.image}",
                    ),
                  ),
                  SizedBox(width: AppSizes.spaceBtwItems),
                  Text(
                    "${controller.reviewList[index!].user!.firstName} ${controller.reviewList[index!].user!.lastName}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),

          SizedBox(height: AppSizes.spaceBtwItems / 2),
          Row(
            children: [
              AppRatingBarIndicator(
                rating: controller.reviewList[index!].rating!.toDouble(),
              ),
              SizedBox(width: AppSizes.spaceBtwItems),
              Text(
                DateFormat("dd MMM, yyyy").format(
                  DateTime.parse(controller.reviewList[index!].createdAt!),
                ),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwItems / 2),
          ReadMoreText(
            "${controller.reviewList[index!].review}",
            trimLines: 2,
            trimCollapsedText: "Less",
            trimExpandedText: "Show more",
            moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwItems),
          controller.reviewList[index!].responseReview == null
              ? Center()
              : AppRoundedContainer(
                  backgroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(AppSizes.md),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trendify Store",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              DateFormat("dd MMM, yyyy").format(
                                DateTime.parse(
                                  controller
                                      .reviewList[index!]
                                      .dateResponseReview!,
                                ),
                              ),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.spaceBtwItems),
                        ReadMoreText(
                          "${controller.reviewList[index!].responseReview}",
                          trimLines: 2,
                          trimCollapsedText: "Less",
                          trimExpandedText: "Show more",
                          moreStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                          lessStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
