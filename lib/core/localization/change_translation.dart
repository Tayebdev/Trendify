import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:trendify_app/core/services/app_services.dart';

class ChangeTranslation extends GetxController {
  Locale? language;

  AppServices appServices = Get.find();

  Future<void> changeLang(String langCode) async {
    Locale locale = Locale(langCode);
    await appServices.sharedPref.setString('langCode', langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = appServices.sharedPref.getString('langCode');
    if (sharedPrefLang == "ar") {
      language = Locale(sharedPrefLang!);
    } else {
      if (sharedPrefLang == "en") {
        language = Locale(sharedPrefLang!);
      } else {
        if (sharedPrefLang == "fr") {
          language = Locale(sharedPrefLang!);
        } else {
          language = Locale(Get.deviceLocale!.languageCode);
        }
      }
    }
    super.onInit();
  }
}
