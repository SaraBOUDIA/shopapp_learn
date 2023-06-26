
import 'package:flutter/material.dart';
import 'package:shopapp/controller/onboard_controller.dart';
import 'package:shopapp/core/constant/colors.dart';
import 'package:shopapp/core/functions/dimensions.dart';

Row indicatorList(OnBoardController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ...List.generate(
        3,
        (i) => indicatorDot(i == controller.currentPage),
      )
    ],
  );
}

AnimatedContainer indicatorDot(bool condition) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: getWidth(1)),
    height: getHeight(8),
    width: condition ? getWidth(14) : getWidth(8),
    decoration: BoxDecoration(
      color: condition ? AppColor.primaryColor : Colors.grey[400],
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
