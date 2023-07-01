import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/core/constant/color.dart';
import 'package:shopapp/core/functions/dimensions.dart';

class ProductTextFiled extends StatelessWidget {
  const ProductTextFiled({
    required this.assetName,
    required this.valid,
    required this.controller,
    required this.hint,
    this.min = 1,
    this.max = 1,
    this.type = TextInputType.text,
    super.key,
  });
  final String? Function(String) valid;
  final String hint;
  final String assetName;
  final int min;
  final int max;
  final TextInputType type;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return valid(value!);
      },
      controller: controller,
      minLines: min,
      maxLines: max,
      keyboardType: type,
      cursorColor: AppColor.secendColor,
      decoration: InputDecoration(
        suffixIcon: SvgPicture.asset(
          assetName,
          height: getHeight(8),
        ),
        focusColor: AppColor.primaryColor,
        fillColor: AppColor.primaryColor,
        hoverColor: AppColor.primaryColor,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
