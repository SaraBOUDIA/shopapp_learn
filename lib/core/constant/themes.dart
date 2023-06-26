import 'package:flutter/material.dart';
import 'package:shopapp/core/constant/colors.dart';

ThemeData englishTheme = ThemeData(
    primarySwatch: AppColor.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.iconsColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedLabelStyle: TextStyle(
        color: AppColor.iconsColor,
      ),
      selectedLabelStyle: TextStyle(
        color: AppColor.greyColor,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 33,
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        height: 1.5,
        wordSpacing: 2,
        fontSize: 17,
        color: Colors.grey[600],
        fontWeight: FontWeight.normal,
      ),
    ));

ThemeData arabicTheme = ThemeData(
    primarySwatch: Colors.teal,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.backgroundColor,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 33,
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        height: 1.5,
        wordSpacing: 2,
        fontSize: 17,
        color: Colors.grey[600],
        fontWeight: FontWeight.normal,
      ),
    ));
