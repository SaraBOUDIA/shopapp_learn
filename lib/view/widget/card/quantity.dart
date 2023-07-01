import 'package:flutter/material.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/data/model/product_model.dart';
import 'package:shopapp/view/widget/feeds/feed/gridshow.dart';

Row quantitySetting(
  ProductModel product,
   {
  required void Function(ProductModel product) minus,
  required void Function(ProductModel product) plus,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      littlePrice(
          (int.parse(product.pric) * product.quantity).toString()),
      quantity(
        minus: minus,
        plus: plus,
        product: product,
      ),
    ],
  );
}

quantity({
  required void Function(ProductModel product) minus,
  required void Function(ProductModel product) plus,
  required ProductModel product,
}) {
  return Row(
    children: [
      IconButton(
        onPressed: () {
          minus(product);
        },
        icon: const Icon(Icons.remove),
        iconSize: getHeight(18),
      ),
      Text('${product.quantity}'),
      IconButton(
        onPressed: () {
          plus(product);
        },
        icon: const Icon(Icons.add),
        iconSize: getHeight(18),
      ),
    ],
  );
}
