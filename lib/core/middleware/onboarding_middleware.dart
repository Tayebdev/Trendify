import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import '../services/app_services.dart';

class OnboardingMiddleware extends GetMiddleware {
  final AppServices appServices = Get.find<AppServices>();

  @override
  RouteSettings? redirect(String? route) {
    final hasVisited = appServices.sharedPref.getBool('visited');
    if (hasVisited == true) {
      if (appServices.sharedPref.getBool('isLoggedIn') == true ||
          appServices.sharedPref.getBool("signedUp") == true) {
        return const RouteSettings(name: AppRoutes.navigationMenu);
      } else {
        return const RouteSettings(name: AppRoutes.login);
      }
    }

    return null;
  }
}
