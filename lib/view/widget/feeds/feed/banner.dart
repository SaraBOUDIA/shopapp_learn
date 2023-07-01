import 'package:flutter/material.dart';
import 'package:shopapp/core/constant/boxshadow.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/data/model/product_model.dart';

SizedBox banners({
  required List<dynamic> topList,
  required PageController pageController,
  required int currentPage,
  required Function(int)? onChange,
  required Function(ProductModel item) onTap,
}) {
  return SizedBox(
      height: getHeight(210),
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        onPageChanged: onChange,
        itemCount: topList.length,
        itemBuilder: (context, index) {
          double scal = currentPage == index ? 1 : 0.85;
          return TweenAnimationBuilder(
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
            duration: const Duration(milliseconds: 150),
            tween: Tween(begin: scal, end: scal),
            child: AnimatedOpacity(
              opacity: scal == 1 ? 1 : 0.7,
              duration: const Duration(microseconds: 350),
              child: buildTopItem(topList[index], onTap),
            ),
          );
        },
      ));
}

InkWell buildTopItem(
    ProductModel product, Function(ProductModel product) onTap) {
  return InkWell(
    onTap: () {
      onTap(product);
    },
    child: Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: getWidth(290),
      height: getHeight(210),
      decoration: BoxDecoration(
          boxShadow: shadowApp,
          borderRadius: BorderRadius.circular(getHeight(50)),
          image: DecorationImage(
            image: FileImage(
              product.image,
            ),
            fit: BoxFit.cover,
          )),
    ),
  );
}
