import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controller/onboard_controller.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/data/datasource/static/static.dart';

GetBuilder<OnBoardController> onBoardingSlider(PageController pageController) {
  return GetBuilder<OnBoardController>(
    init: OnBoardController(),
    builder: (controller) => PageView.builder(
      controller: pageController,
      itemCount: onBoardingList.length,
      onPageChanged: (value) {
        controller.pageChanged(value);
      },
      itemBuilder: (context, index) => onBoardingItem(context, index),
    ),
  );
}

Column onBoardingItem(context, int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: getHeight(45),
      ),
      Text(
        onBoardingList[index].title,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      SizedBox(
        height: getHeight(45),
      ),
      Container(
        padding: EdgeInsets.all(getHeight(12)),
        height: getHeight(320),
        child: Image.asset(
          onBoardingList[index].image,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        height: getHeight(20),
      ),
      Text(
        onBoardingList[index].body,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ],
  );
}
