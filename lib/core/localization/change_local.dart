import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/core/constant/apptheme.dart';
import 'package:shopapp/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? language;
  AppServices services = Get.find();
  late ThemeData appTheme;
  changeLang(String languageCode) {
    Locale locale = Locale(languageCode);
    services.sharedPreferences.setString('lang', languageCode);
    appTheme = languageCode == 'ar' ? arabicTheme : englishTheme;
    Get.updateLocale(locale);
    Get.changeTheme(appTheme);
  }

  @override
  void onInit() {
    String? currentLang = services.sharedPreferences.getString('lang');
    language = currentLang != null
        ? Locale(currentLang)
        : Locale(Get.deviceLocale!.languageCode);
    appTheme = currentLang == 'ar' ? arabicTheme : englishTheme;
    super.onInit();
  }
}
