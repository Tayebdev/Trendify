import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trendify_app/core/services/app_services.dart';
import '../my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(DevicePreview(enabled: false, builder: (context) => MyApp()));
}
