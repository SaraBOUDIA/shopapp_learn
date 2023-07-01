import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controller/dashboard/dashboard_controller.dart';
import 'package:shopapp/core/constant/color.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/view/screen/dashboard/new_item.dart';
import 'package:shopapp/view/widget/appbar.dart';
import 'package:shopapp/view/widget/drawer/drawer.dart';

class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardControllerImp());
    return Scaffold(
      appBar: homeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(12), vertical: getHeight(12)),
        child: Center(
          child: InkWell(
            onTap: () {
              Get.to(() => const NewItemScreen());
            },
            child: Container(
              alignment: Alignment.topCenter,
              width: getWidth(240),
              height: getHeight(50),
              // padding: EdgeInsets.symmetric(
              //   // horizontal: getWidth(40),
              //   vertical: getHeight(15),
              // ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getWidth(40)),
                color: AppColor.primaryColor,
              ),
              child: Text(
                'Add New Item',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.08,
                  fontSize: getWidth(18),
                ),
              ),
            ),
          ),

          // const NewItemScreen(),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
