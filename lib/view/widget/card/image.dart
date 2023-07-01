import 'package:flutter/material.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/data/model/product_model.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    required this.product,
    super.key,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHeight(120),
      height: getHeight(120),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(product.image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(getWidth(20))),
    );
  }
}
