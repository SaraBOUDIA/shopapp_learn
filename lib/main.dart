import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/binding.dart';
import 'package:shopapp/core/localization/change_local.dart';
import 'package:shopapp/core/localization/translation.dart';
import 'package:shopapp/core/services/services.dart';
import 'package:shopapp/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    LocaleController localController = Get.put(LocaleController());
    return GetMaterialApp(
      translations: AppLanguges(),
      // home: const TestScreen(),
      locale: localController.language,
      debugShowCheckedModeBanner: false,
      getPages: routes,
      theme: localController.appTheme,
      initialBinding: MyBinding(),
    );
  }
}
