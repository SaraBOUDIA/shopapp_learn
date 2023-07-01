// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/core/constant/color.dart';
import 'package:shopapp/core/functions/dimensions.dart';

class SearchBarApp extends StatelessWidget {
  const SearchBarApp({
    required this.controller,
    required this.search,
    super.key,
  });
  final TextEditingController controller;
  final void Function(String key) search;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getHeight(55),
      padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getWidth(18)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              blurRadius: 22,
              spreadRadius: 5.5,
            )
          ]),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/search.svg',
            height: getHeight(15),
            color: Colors.grey,
          ),
          SizedBox(
            width: getWidth(8),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: search,
              cursorColor: AppColor.primaryColor,
              decoration: const InputDecoration(
                  hintText: 'Search', border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
