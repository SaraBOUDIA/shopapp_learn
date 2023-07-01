import 'package:flutter/material.dart';
import 'package:shopapp/data/model/product_model.dart';

IconButton cancelButton({
  required ProductModel product,
  required Function(ProductModel product) cancel,
}) =>
    IconButton(
      onPressed: () {
        cancel(product);
      },
      icon: const Icon(Icons.cancel),
    );
