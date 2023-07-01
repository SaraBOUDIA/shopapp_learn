import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controller/home/feeds_controller.dart';
import 'package:shopapp/controller/home/home_controller.dart';
import 'package:shopapp/data/datasource/static/static.dart';
import 'package:shopapp/view/widget/appbar.dart';
import 'package:shopapp/view/widget/drawer/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    Get.put(HomeControllerImp());
    Get.put(FeedsControllerImp());
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return Scaffold(
        appBar: homeAppBar(),
        body: homeScreens[controller.selectedIndex],
        bottomNavigationBar: HomeBottomNavigation(
          items: controller.bottomNavItems(),
          onTap: (index) {
            controller.changScreen(index);
          },
          selectedIndex: controller.selectedIndex,
        ),
        drawer: const AppDrawer(),
      );
    });
  }
}
