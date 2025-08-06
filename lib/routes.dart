import 'package:flutter/material.dart';
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
  AppRoutes.verifyCode :(context)=>VerifyCodeView()
};
