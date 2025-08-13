import 'package:flutter/material.dart';
import 'package:trendify_app/navigation_menu.dart';
import 'package:trendify_app/view/screen/address/address_view.dart';
import 'package:trendify_app/view/screen/auth/success_created_view.dart';
import 'package:trendify_app/view/screen/product/product_details_view.dart';
import 'package:trendify_app/view/screen/product/product_reviews.dart';
import 'package:trendify_app/view/screen/profile/profile_view.dart';
import '../view/screen/auth/verify_code_view.dart';
import '../view/screen/auth/verify_email_view.dart';
import '../view/screen/auth/forget_password_view.dart';
import '../view/screen/auth/signup_view.dart';
import '../core/constant/app_routes.dart';
import '../view/screen/auth/login_view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (context) => LoginView(),
  AppRoutes.signUp:(context)=>SignupView(),
  AppRoutes.forgetPassword:(context)=>ForgetPasswordView(),
  AppRoutes.verifyEmail :(context)=>VerifyEmailView(),
  AppRoutes.verifyCode :(context)=>VerifyCodeView(),
  AppRoutes.successCreated:(context)=>SuccessCreatedView(),
  AppRoutes.navigationMenu:(context)=>NavigationMenu(),
  AppRoutes.profile:(context)=>ProfileView(),
  AppRoutes.productDetails:(context)=>ProductDetailsView(),
  AppRoutes.productReviews:(context)=>ProductReviews(),
  AppRoutes.addressUser:(context)=>AddressView(),
};
