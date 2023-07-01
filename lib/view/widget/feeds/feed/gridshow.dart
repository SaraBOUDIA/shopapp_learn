// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/core/constant/boxshadow.dart';
import 'package:shopapp/core/constant/color.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/data/model/product_model.dart';

GridView itemShowGrid({
  required List<dynamic> products,
  required Function(ProductModel item) onTap,
  required Function(ProductModel item) fav,
}) {
  return GridView.count(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 2,
    // mainAxisSpacing: getHeight(140),
    childAspectRatio: 0.55,
    children: [
      ...List.generate(
        products.length,
        (index) => itemShow(products[index], onTap,fav),
      ),
    ],
  );
}

InkWell itemShow(
  ProductModel product,
  Function(ProductModel item) onTap,
  Function(ProductModel item) fav,
) {
  return InkWell(
    onTap: () {
      onTap(product);
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: getHeight(220),
          margin: EdgeInsets.all(getWidth(8)),
          decoration: BoxDecoration(
            boxShadow: shadowApp,
            borderRadius: BorderRadius.circular(getWidth(20)),
            image: DecorationImage(
              image: FileImage(product.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: getWidth(20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemName(product.name),
                littlePrice(product.pric),
              ],
            ),
            const Spacer(),
            favouriteButton(product,fav),
          ],
        ),
      ],
    ),
  );
}

InkWell favouriteButton(ProductModel product, Function(ProductModel item) onTap) {
  return InkWell(
    onTap: () {
      onTap(product);
    },
    child: CircleAvatar(
      backgroundColor: Colors.grey[200],
      child: SvgPicture.asset(
        product.isFavourite
            ? 'assets/icons/fheart.svg'
            : 'assets/icons/heart.svg',
        height: getHeight(22),
        color: product.isFavourite ? Colors.red : Colors.grey[600],
      ),
    ),
  );
}

Text itemName(String name) {
  return Text(
    name,
    style: TextStyle(
      fontSize: getWidth(20),
      color: const Color(0xff0F2851),
    ),
  );
}

Row littlePrice(String price) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        price,
        style: TextStyle(
          fontSize: getWidth(18),
          color: AppColor.primaryColor,
        ),
      ),
      const Text(
        ' DZD',
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    ],
  );
}
