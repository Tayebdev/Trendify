import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_texts.dart';
import 'package:trendify_app/view/widget/home/app_primary_header_container.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../appbar/appbar.dart';
import '../home/app_cart_counter_item.dart';
import '../text_field/search_appbar.dart';

class AppStoreHeader extends StatelessWidget {
  const AppStoreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: AppSizes.storePrimaryHeaderHight + 10),
        AppHomePrimaryHeaderContainer(
          height: AppSizes.storePrimaryHeaderHeight,
          child: UAppBar(
            title: Text(
              AppTexts.store,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(color: AppColors.white),
            ),
            actions: [AppCartCounterItem()],
          ),
        ),
        SearchAppbar(),
      ],
    );
  }
}
