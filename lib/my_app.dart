import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/bindings/my_bindings.dart';
import 'package:trendify_app/core/theme/theme.dart';
import '../routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: DevicePreview.appBuilder,
      initialBinding: MyBindings(),
      title: 'Trendify',
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
