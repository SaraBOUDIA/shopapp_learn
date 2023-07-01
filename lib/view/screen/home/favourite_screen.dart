import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controller/home/feeds_controller.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/data/datasource/products/fav_products.dart';
import 'package:shopapp/view/widget/fav/favshow.dart';
import 'package:shopapp/view/widget/fav/title.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getHeight(35),
            ),
            favItem(),
            SizedBox(
              height: getHeight(15),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: GetBuilder<FeedsControllerImp>(builder: (controller) {
                  return favShowGrid(
                    favItems: favProducts,
                    onTap: (product) {
                      controller.showProduct(product);
                    },
                    fav: (product) {
                      controller.fav(product);
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
