// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:shopapp/core/constant/color.dart';
import 'package:shopapp/core/constant/routes.dart';
import 'package:shopapp/core/functions/dimensions.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getHeight(40),
        ),
        DrawerItem(
          icon: SvgPicture.asset(
            'assets/icons/home.svg',
            height: getHeight(30),
            color: Colors.white,
          ),
          onPress: () {
            Get.offAllNamed("/");
          },
          title: 'Home',
        ),
        SizedBox(
          height: getHeight(10),
        ),
        SizedBox(
          height: getHeight(10),
        ),
        DrawerItem(
          icon: SvgPicture.asset(
            'assets/icons/dashboard.svg',
            height: getHeight(30),
            color: Colors.white,
          ),
          onPress: () {
            Get.offNamed(AppRoute.dashBoard);
          },
          title: 'Dashboard',
        ),
        const Spacer(),
        const Divider(
          height: 2,
          color: Colors.white,
        ),
        SizedBox(
          height: getHeight(12),
        ),
        DrawerItem(
            icon: SvgPicture.asset(
              'assets/icons/exit.svg',
              height: getHeight(30),
              color: Colors.white,
            ),
            onPress: () {
              exit(0);
            },
            title: 'Exit')
      ],
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    required this.icon,
    required this.onPress,
    required this.title,
    super.key,
  });
  final Widget icon;
  final Function onPress;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            // color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColor.secendColor,
              style: BorderStyle.solid,
              width: 2,
            )),
        child: Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: getWidth(16),
              ),
            ),
            const Spacer(),
            icon,
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
