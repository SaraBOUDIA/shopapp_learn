import 'package:flutter/material.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/view/widget/card/buy.dart';

Row checkIsTop({required bool value, required Function onClick}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    mainAxisSize: MainAxisSize.min,
    children: [
      Checkbox(
        value: value,
        onChanged: (value) {
          onClick();
        },
      ),
      Text(
        'Add to Top Product',
        style: TextStyle(
          color: Colors.black,
          fontSize: getWidth(20),
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Column addNowButton(Function add, {bool edit = false}) {
  return Column(
    children: [
      Center(
        child: Buy(
          buy: () {
            add();
          },
          title: edit ? 'Edit Now ' : 'Add Now',
        ),
      ),
      SizedBox(
        height: getHeight(22),
      ),
    ],
  );
}
