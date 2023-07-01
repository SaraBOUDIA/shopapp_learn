import 'package:flutter/material.dart';
import 'package:shopapp/core/constant/color.dart';
import 'package:shopapp/core/functions/dimensions.dart';

Container categories({
  required List<String> categories,
  required String currentCategory,
  Function(int index)? onTap,
}) {
  return Container(
    height: getHeight(40),
    alignment: Alignment.center,
    child: ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return categoryItem(
          category: categories[index],
          condition: categories[index] == currentCategory,
          ontap: () {
            if (onTap != null) {
              onTap(index);
            }
          },
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: getWidth(12)),
      itemCount: categories.length,
    ),
  );
}

InkWell categoryItem({
  required String category,
  required bool condition,
  required Function() ontap,
}) {
  return InkWell(
    onTap: () {
      ontap();
    },
    child: Container(
      // alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(20),
        // vertical: getHeight(2),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getWidth(12)),
        color: condition ? AppColor.primaryColor : AppColor.grey,
      ),
      child: Text(
        category,
        style: TextStyle(
          fontWeight: !condition ? FontWeight.w500 : FontWeight.bold,
          color: condition ? Colors.black : Colors.white,
          letterSpacing: 1.04,
          fontSize: getWidth(18),
        ),
      ),
    ),
  );
}
