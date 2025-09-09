import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';

import '../../constant/app_images.dart';

// ignore: must_be_immutable
class AppFailure extends StatelessWidget {
  AppFailure({super.key, this.subtitle, this.title});

  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppImages.failureAnimation, width: 300, height: 300),
          Text(title!, style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: 15),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: AppSizes.spaceBtwSections,)
        ],
      ),
    );
  }
}
