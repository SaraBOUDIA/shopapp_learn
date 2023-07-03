import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/core/class/db_helper.dart';
import 'package:shopapp/core/functions/add_favcard.dart';
import 'package:shopapp/data/datasource/products/card_items.dart';
import 'package:shopapp/data/datasource/products/search_results.dart';
import 'package:shopapp/data/model/product_model.dart';
import 'package:shopapp/view/screen/dashboard/edit_item.dart';
import 'package:shopapp/view/screen/product_details.dart';

abstract class FeedsController extends GetxController {
  changeBnnerPage(int index);
  fav(ProductModel product);
  card(ProductModel product);
  showProduct(ProductModel product);
  void plus(ProductModel product);
  void minus(ProductModel product);
  search(String key);
  int cardSome();
}

class FeedsControllerImp extends FeedsController {
  late int currentBannerPage;
  @override
  changeBnnerPage(int index) {
    currentBannerPage = index;
    update();
  }

  late final PageController pageController;

  @override
  showProduct(ProductModel product) {
    Get.to(() => ItemPage(product));
  }

  @override
  fav(ProductModel product) {
    addToFav(product);
    update();
  }

  @override
  card(ProductModel product) {
    addToCard(product);
    
    update();
  }

  @override
  plus(ProductModel product) {
    product.quantity += 1;
    DbHelper.dbHelper.updateProduct(product: product);
    update();
  }

  @override
  minus(ProductModel product) {
    if (product.quantity > 1) {
      product.quantity -= 1;
      DbHelper.dbHelper.updateProduct(product: product);
      update();
    }
  }

  late TextEditingController searchController;
  @override
  search(String key) {
    getSearchResults(key).then((value) {
      searchResults = value;
      update();
    });
  }

  void searchEnd() {
    Get.back();
    searchController.text = '';
  }

  void editItem(ProductModel product) {
    Get.to(() => EditItemScreen(product: product));
    Get.delete<FeedsControllerImp>();
  }

  @override
  void onInit() {
    pageController = PageController(viewportFraction: 0.84, initialPage: 0);
    searchController = TextEditingController();

    currentBannerPage = 0;
    super.onInit();
  }

  @override
  int cardSome() {
    int somme = 0;
    for (var product in cardProducts) {
      somme += int.parse(product.pric) * product.quantity;
    }
    return somme;
  }
}
