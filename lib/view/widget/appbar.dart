// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/core/constant/color.dart';
import 'package:shopapp/core/functions/dimensions.dart';

class HomeBottomNavigation extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final void Function(int) onTap;
  final int selectedIndex;
  const HomeBottomNavigation({
    super.key,
    required this.items,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppColor.primaryColor,
      backgroundColor: AppColor.backgroundcolor,
      onTap: onTap,
      currentIndex: selectedIndex,
      items: items,
    );
  }
}

AppBar homeAppBar() {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    leading: const Leading(),
    title: const Title(),
    actions: avatar,
  );
}

class Leading extends StatelessWidget {
  const Leading({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: CircleAvatar(
        backgroundColor: Colors.white,
        child: SvgPicture.asset(
          'assets/icons/four-squares-icon.svg',
          height: getHeight(22),
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo 1.png',
      height: getHeight(120),
    );
  }
}

List<Widget> get avatar {
  return [
    const CircleAvatar(
      backgroundImage: AssetImage('assets/images/profile.jpeg'),
    ),
    SizedBox(
      width: getWidth(20),
    ),
  ];
}
