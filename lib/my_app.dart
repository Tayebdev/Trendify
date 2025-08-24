import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/theme/theme.dart';
import 'package:trendify_app/view/screen/auth/login_view.dart';
import '../routes.dart';
import 'splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: DevicePreview.appBuilder,
      title: 'Trendify',
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      //home: SplashScreen(),
      //home: LoginView(),
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
