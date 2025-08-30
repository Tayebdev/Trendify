import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
          title: const Text("My Orders"),
          bottom: TabBar(
            dividerColor: Colors.transparent,
            labelColor: AppColors.primary,
            unselectedLabelColor: dark ? AppColors.white : AppColors.black,
            indicatorColor: AppColors.primary,
            labelStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            tabs: const [
              Tab(text: "Active"),
              Tab(text: "Completed"),
              Tab(text: "Canceled"),
            ],
          ),
        ),
        body: Padding(
          padding: AppPadding.screenPadding,
          child: const TabBarView(
            children: [
              Center(child: Text("Active")),
              Center(child: Text("Completed")),
              Center(child: Text("Canscled")),
            ],
          ),
        ),
      ),
    );
  }
}
