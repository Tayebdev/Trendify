import 'package:flutter/material.dart';
import '../core/constant/app_routes.dart';
import '../view/screen/auth/login_view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (context) => LoginView(),
};
