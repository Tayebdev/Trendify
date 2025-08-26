import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

import '../services/app_services.dart';

class OnboardingMiddleware extends GetMiddleware{
  AppServices? appServices=Get.find<AppServices>();

  @override
  RouteSettings? redirect(String? route) {
    if (appServices!.sharedPref.getBool('visited')==true) {
     return RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}