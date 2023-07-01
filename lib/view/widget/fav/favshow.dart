// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/data/model/product_model.dart';
import 'package:shopapp/view/widget/feeds/feed/gridshow.dart';

GridView favShowGrid({
  required List<ProductModel> favItems,
  required Function(ProductModel prduct) onTap,
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
        favItems.length,
        (index) => favShow(
          favItem: favItems[index],
          onTap: onTap,
          fav: fav,
        ),
      ),
    ],
  );
}

InkWell favShow({
  required ProductModel favItem,
  required Function(ProductModel product) onTap,
  required Function fav,
}) {
  return InkWell(
    onTap: () {
      onTap(favItem);
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: getHeight(220),
          margin: EdgeInsets.all(getWidth(8)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getWidth(20)),
            image: DecorationImage(
              image: FileImage(favItem.image),
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
                itemName(favItem.name),
                SizedBox(
                  height: getHeight(5),
                ),
                littlePrice(favItem.pric),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                fav(favItem);
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: SvgPicture.asset(
                  favItem.isFavourite
                      ? 'assets/icons/fheart.svg'
                      : 'assets/icons/heart.svg',
                  height: getHeight(22),
                  color: favItem.isFavourite ? Colors.red : Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ],
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
