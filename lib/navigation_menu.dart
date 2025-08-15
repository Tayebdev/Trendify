import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_colors.dart';

import 'helpers/function_helpers.dart';
import 'view/screen/home/home_view.dart';
import 'view/screen/profile/setting_view.dart';
import 'view/screen/store/store_view.dart';
import 'view/screen/wish_list_view.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    bool dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(color: AppColors.primary);
              }
              return IconThemeData(
                color: dark ? AppColors.grey : AppColors.darkerGrey,
              );
            }),
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
              states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                );
              }
              return TextStyle(
                color: dark ? AppColors.grey : AppColors.darkerGrey,
              );
            }),
          ),
          child: NavigationBar(
            elevation: 0,

            backgroundColor: dark ? AppColors.dark : AppColors.light,
            indicatorColor: dark
                ? AppColors.light.withValues(alpha: 0.1)
                : AppColors.dark.withValues(alpha: 0.1),
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
            },
            destinations: [
              NavigationDestination(
                icon: IconTheme(
                  data: IconThemeData(
                    color: controller.selectedIndex.value == 0
                        ? AppColors.primary
                        : (dark ? AppColors.grey : AppColors.darkerGrey),
                  ),
                  child: Icon(Iconsax.home),
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: IconTheme(
                  data: IconThemeData(
                    color: controller.selectedIndex.value == 1
                        ? AppColors.primary
                        : (dark ? AppColors.grey : AppColors.darkerGrey),
                  ),
                  child: Icon(Iconsax.shop),
                ),
                label: 'Store',
              ),
              NavigationDestination(
                icon: IconTheme(
                  data: IconThemeData(
                    color: controller.selectedIndex.value == 2
                        ? AppColors.primary
                        : (dark ? AppColors.grey : AppColors.darkerGrey),
                  ),
                  child: Icon(Iconsax.heart),
                ),
                label: 'Wishlist',
              ),
              NavigationDestination(
                icon: IconTheme(
                  data: IconThemeData(
                    color: controller.selectedIndex.value == 3
                        ? AppColors.primary
                        : (dark ? AppColors.grey : AppColors.darkerGrey),
                  ),
                  child: Icon(Iconsax.user),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  RxInt selectedIndex = 0.obs;

  List<Widget> screens = [
    HomeView(),
    StoreView(),
    WishListView(),
    SettingView(),
  ];
}
