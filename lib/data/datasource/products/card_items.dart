import 'package:shopapp/data/datasource/products/all_products.dart';
import 'package:shopapp/data/model/product_model.dart';

List<ProductModel> cardProducts = [];

void getCardProduct() {
  cardProducts = [];
  for (var element in products ) {
    if (element.isCard) cardProducts.add(element);
  }
}
