import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../helpers/function_helpers.dart';

// ignore: must_be_immutable
class AppCartCounterItem extends StatelessWidget {
  AppCartCounterItem({super.key});
  HomeControllerImp controller = Get.put(HomeControllerImp());
  @override
  Widget build(BuildContext context) {
    bool dark = AppHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: () {controller.goToCart();},
          icon: Icon(
            Iconsax.shopping_bag,
            color: dark ? AppColors.dark : AppColors.light,
          ),
        ),
        Positioned(
          right: 8,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: dark ? AppColors.light : AppColors.dark,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  fontSizeFactor: 0.8,
                  color: dark ? AppColors.dark : AppColors.light,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
