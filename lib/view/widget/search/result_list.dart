import 'package:flutter/material.dart';
import 'package:shopapp/controller/home/feeds_controller.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/data/datasource/products/search_results.dart';
import 'package:shopapp/data/model/product_model.dart';
import 'package:shopapp/view/widget/card/image.dart';
import 'package:shopapp/view/widget/feeds/feed/gridshow.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    required this.controller,
    super.key,
  });
  final FeedsControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => SearchItem(
        controller: controller,
        product: searchResults[index],
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: getHeight(8),
      ),
      itemCount: searchResults.length,
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.controller,
    required this.product,
  });
  final ProductModel product;
  final FeedsControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.showProduct(product);
      },
      child: Container(
        padding: EdgeInsets.all(getWidth(5)),
        margin: EdgeInsets.all(getHeight(12)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getWidth(20)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            ProductImage(
              product: product,
            ),
            SizedBox(
              width: getWidth(20),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemName(product.name),
                  // itemCategory(product),
                  SizedBox(
                    height: getHeight(25),
                  ),
                  littlePrice(product.pric),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
