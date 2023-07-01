import 'package:flutter/material.dart';
import 'package:shopapp/data/model/onboardin_model.dart';
import 'package:shopapp/view/screen/home/card_screen.dart';
import 'package:shopapp/view/screen/home/favourite_screen.dart';
import 'package:shopapp/view/screen/home/feeds_screen.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: 'Screen 1',
      image: 'assets/images/splash_1.png',
      body: 'Desc ...\nDe sc ...\nDe sc ...\nDe sc ...\n'),
  OnBoardingModel(
      title: 'Screen 2', image: 'assets/images/splash_2.png', body: 'Desc ...'),
  OnBoardingModel(
      title: 'Screen 3', image: 'assets/images/splash_3.png', body: 'Desc ...'),
];

List<Widget> homeScreens = [
  const FeedsScreen(),
  const Favourite(),
  const CardPage(),
];
