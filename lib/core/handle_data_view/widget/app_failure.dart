import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constant/app_images.dart';

class AppFailure extends StatelessWidget {
  const AppFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppImages.failureAnimation, width: 350, height: 350),
          SizedBox(height: 30),
          Text(
            "No Check order here yet!",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 15),
          Text(
            "Your order list is currently empty. Once you \n place an order, it will appear here.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
