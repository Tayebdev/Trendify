import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_routes.dart';
import '../services/app_services.dart';

class SignupMiddleware extends GetMiddleware {
  final AppServices appServices = Get.find<AppServices>();

  @override
  RouteSettings? redirect(String? route) {
    final isLoggedIn = appServices.sharedPref.getBool('isLoggedIn') ?? false;
    final token = appServices.sharedPref.getString("token");

    if (isLoggedIn && token != null) {
      return const RouteSettings(name: AppRoutes.navigationMenu);
    }
    return null;
  }
}
