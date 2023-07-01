import 'package:flutter/material.dart';
import 'package:shopapp/core/constant/color.dart';
import 'package:shopapp/core/functions/dimensions.dart';

class Buy extends StatelessWidget {
  const Buy({
    required this.buy,
    this.title = 'Check out',
    super.key,
  });
  final Function() buy;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buy();
      },
      child: Container(
        alignment: Alignment.topCenter,
        width: getWidth(160),
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
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.08,
            fontSize: getWidth(18),
          ),
        ),
      ),
    );
  }
}
