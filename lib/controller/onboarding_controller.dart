import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/data/static/static.dart';

import '../core/services/app_services.dart';

abstract class OnboardingController extends GetxController {
  Future<void> nextPage();
  void skipPage();
  void upadtePageIndicator(int index);
  void dotNavigationClick(int index);
}

class OnboardingControllerImp extends OnboardingController {
  static OnboardingControllerImp get instance => Get.find();
  final pageController = PageController();
  RxInt currentPage = 0.obs;

  @override
  upadtePageIndicator(index) {
    currentPage.value = index;
  }

  @override
  dotNavigationClick(index) {
    currentPage.value = index;
    pageController.jumpToPage(index);
  }

  @override
  nextPage() async {
    AppServices appServices = Get.find<AppServices>();

    if (currentPage.value == onboardingList.length - 1) {
      await appServices.sharedPref.setBool("visited", true);
      await Get.offAllNamed(AppRoutes.login);
      return;
    }

    currentPage.value++;
    pageController.jumpToPage(currentPage.value);

    return;
  }

  @override
  skipPage() {
    currentPage.value = onboardingList.length - 1;
    pageController.jumpToPage(currentPage.value);
  }
}
