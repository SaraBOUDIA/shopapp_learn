import 'package:shopapp/data/datasource/products/all_products.dart';
import 'package:shopapp/data/model/product_model.dart';

List<ProductModel> favProducts = [];

void getFavouriteProduct() {
  favProducts = [];
  for (var element in products) {
    if (element.isFavourite) {
      favProducts.add(element);
    }
  }
}
