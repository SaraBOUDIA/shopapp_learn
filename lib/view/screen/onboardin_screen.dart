import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controller/onboard_controller.dart';
import 'package:shopapp/core/constant/color.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/core/services/services.dart';
import 'package:shopapp/data/datasource/static/static.dart';
import 'package:shopapp/view/widget/onboarding/indicator.dart';
import 'package:shopapp/view/widget/onboarding/onboarding_item.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 4,
          child: onBoardingSlider(pageController),
        ),
        Expanded(
          child: GetBuilder<OnBoardController>(builder: (controller) {
            return Column(
              children: [
                indicatorList(controller),
                SizedBox(
                  height: getHeight(35),
                ),
                continueButton(pageController, controller.currentPage),
                SizedBox(
                  height: getHeight(8),
                ),
                skipButton(),
              ],
            );
          }),
        ),
      ],
    ));
  }

  InkWell skipButton() {
    return InkWell(
      onTap: () {
        Get.offAllNamed('/login');
      },
      child: Text(
        'Skip'.tr,
        style: TextStyle(
            letterSpacing: 1.2,
            color: Colors.black,
            fontSize: getHeight(15),
            fontWeight: FontWeight.w600),
      ),
    );
  }

  InkWell continueButton(PageController pageController, int currentPage) {
    SharedPrefServices services = Get.put(SharedPrefServices());
    return InkWell(
      onTap: () {
        if (currentPage == onBoardingList.length - 1) {
          services.sharedPreferences.setBool('onBoard', false);
          Get.offAllNamed('/login');
        } else {
          pageController.nextPage(
            duration: const Duration(milliseconds: 250),
            curve: Curves.ease,
          );
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: getHeight(45),
        width: getWidth(200),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1.8,
              blurRadius: 3.7,
            ),
          ],
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(getHeight(15)),
        ),
        child: Text(
          currentPage == onBoardingList.length - 1
              ? 'Go Home'.tr
              : 'Continue'.tr,
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
