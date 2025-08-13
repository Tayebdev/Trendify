import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/appbar/appbar.dart';
import '../../widget/product/app_overall_product_rating.dart';
import '../../widget/product/app_rating_bar_indicator.dart';
import '../../widget/product/app_user_review_card.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text("Reviews & Ratings")),
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
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return AppUserReviewCard();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: AppSizes.md);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
