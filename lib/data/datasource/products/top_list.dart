import 'package:get/get.dart';
import 'package:shopapp/data/datasource/products/all_products.dart';

RxList topProduts = [].obs;

void getTopProduct() {
  for (var element in products ) {
    if (element.isTop && !topProduts.contains(element)) {
      topProduts.add(element);
    }
  }
}
