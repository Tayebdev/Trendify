import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_texts.dart';
import '../appbar/appbar.dart';
import 'app_cart_counter_item.dart';
import 'app_notification_item.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return UAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.goodMorning,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.apply(color: AppColors.grey),
          ),
          Text(
            'Boulekzazel Tayeb',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: AppColors.white),
          ),
        ],
      ),
      actions: [AppNotificationItem(),AppCartCounterItem(),],
    );
  }
}
