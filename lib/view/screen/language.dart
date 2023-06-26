// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/core/constant/colors.dart';
import 'package:shopapp/core/constant/routes_name.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/core/localization/change_local.dart';

class LanguageScreen extends GetView<LocaleController> {
  const LanguageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Choose your language :'.tr,
            ),
            SizedBox(
              height: getHeight(50),
            ),
            Container(
              color: AppColor.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: MaterialButton(
                onPressed: () {
                  controller.changeLang('ar');
                  Get.offAllNamed(AppRoute.onBoarding);
                },
                child: const Text('Arabic'),
              ),
            ),
            SizedBox(
              height: getHeight(20),
            ),
            Container(
              color: AppColor.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: MaterialButton(
                onPressed: () {
                  controller.changeLang('en');
                  Get.offAllNamed(AppRoute.onBoarding);
                },
                child: const Text('English'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
