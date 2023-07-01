// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopapp/core/functions/dimensions.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    required this.image,
    super.key,
  });
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHeight(260),
      
      height: getHeight(260),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(getWidth(35)),
      ),
      child: image == null
          ? Image.asset(
              'assets/images/empty.jpeg',
              fit: BoxFit.cover,
            )
          : Image.file(
              image!,
              fit: BoxFit.cover,
            ),
    );
  }
}
