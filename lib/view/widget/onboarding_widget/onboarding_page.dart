import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/data/static/static.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../helpers/device_helpers.dart';
import 'package:lottie/lottie.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});
  static final controller=Get.put(OnboardingControllerImp());
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value)=>controller.upadtePageIndicator(value),
      itemCount: onboardingList.length,
      itemBuilder: (context, item) {
        return Padding(
          padding: EdgeInsetsGeometry.only(
            top: UDeviceHelper.getAppBarHeight()+30,
          ),
          child: Column(
            children: [
              Lottie.asset(onboardingList[item].image!),
              Text(
                onboardingList[item].title!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 10),
              Text(onboardingList[item].body!, textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        );
      },
    );
  }
}
