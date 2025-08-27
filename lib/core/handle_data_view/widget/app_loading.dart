import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import '../../../controller/app_loading_controller.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLoadingController>(
      init: AppLoadingController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  AppImages.loadingAnimation,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                AnimatedBuilder(
                  animation: Listenable.merge([
                    controller.fadeAnimation,
                    controller.scaleAnimation,
                  ]),
                  builder: (context, child) {
                    return Transform.scale(
                      scale: controller.scaleAnimation.value,
                      child: Opacity(
                        opacity: controller.fadeAnimation.value,
                        child: Text(
                          "please wait ...",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
