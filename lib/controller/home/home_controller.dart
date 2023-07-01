// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopapp/core/constant/color.dart';
import 'package:shopapp/core/functions/dimensions.dart';

abstract class HomeController extends GetxController {
  changScreen(int index);
}

class HomeControllerImp extends HomeController {
  List<BottomNavigationBarItem> bottomNavItems() {
    return [
      BottomNavigationBarItem(
        backgroundColor: AppColor.primaryColor,
        icon: SvgPicture.asset(
          'assets/icons/home.svg',
          height: getHeight(25),
          color: selectedIndex == 0 ? AppColor.primaryColor : Colors.grey,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        backgroundColor: AppColor.primaryColor,
        icon: SvgPicture.asset(
          'assets/icons/heart.svg',
          height: getHeight(25),
          color: selectedIndex == 1 ? AppColor.primaryColor : Colors.grey,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        backgroundColor: AppColor.primaryColor,
        icon: SvgPicture.asset(
          'assets/icons/cart-shopping-fast.svg',
          height: getHeight(25),
          color: selectedIndex == 2 ? AppColor.primaryColor : Colors.grey,
        ),
        label: '',
      ),
    ];
  }

  late int selectedIndex;

  @override
  changScreen(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    selectedIndex = 0;

    super.onInit();
  }
}
