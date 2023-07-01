import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/view/widget/drawer/drawerlist.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * 0.75,
      backgroundColor: Colors.white.withOpacity(0),
      child: Column(
        children: [
          SizedBox(
            height: getHeight(50),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(12),
              vertical: getHeight(20),
            ),
            height: Get.height * 0.6,
            // width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(80),
                bottomEnd: Radius.circular(50),
              ),
            ),
            child: const DrawerList(),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
