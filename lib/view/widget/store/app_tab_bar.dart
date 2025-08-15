import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/helpers/device_helpers.dart';
import 'package:trendify_app/helpers/function_helpers.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTabBar({super.key, required this.lisTab});

  final List<Widget> lisTab;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? AppColors.black : AppColors.light,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 10),
        child: TabBar(
          dividerColor: Colors.transparent,
          isScrollable: true,
          indicatorColor: AppColors.primary,
          unselectedLabelColor: AppColors.darkGrey,
          labelColor: dark ? AppColors.white : AppColors.primary,
          tabs: lisTab,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UDeviceHelper.getAppBarHeight()/2);
}
