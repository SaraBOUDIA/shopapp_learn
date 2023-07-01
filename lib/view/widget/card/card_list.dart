import 'package:flutter/material.dart';
import 'package:shopapp/controller/home/feeds_controller.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/data/datasource/products/card_items.dart';
import 'package:shopapp/data/model/product_model.dart';
import 'package:shopapp/view/widget/card/cancel_button.dart';
import 'package:shopapp/view/widget/card/image.dart';
import 'package:shopapp/view/widget/card/quantity.dart';
import 'package:shopapp/view/widget/fav/favshow.dart';

class CardList extends StatelessWidget {
  const CardList({
    required this.controller,
    super.key,
  });
  final FeedsControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CardItem(
        controller: controller,
        product: cardProducts[index],
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: getHeight(8),
      ),
      itemCount: cardProducts.length,
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
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
                  Row(
                    children: [
                      itemName(product.name),
                      const Spacer(),
                      cancelButton(
                        product: product,
                        cancel: (product) {
                          controller.card(product);
                        },
                      )
                    ],
                  ),
                  // itemCategory(product),
                  SizedBox(
                    height: getHeight(25),
                  ),

                  quantitySetting(
                    product,
                    minus: (product) {
                      controller.minus(product);
                    },
                    plus: (product) {
                      controller.plus(product);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
