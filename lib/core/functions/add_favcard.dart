import 'package:shopapp/core/class/db_helper.dart';
import 'package:shopapp/data/datasource/products/card_items.dart';
import 'package:shopapp/data/datasource/products/fav_products.dart';
import 'package:shopapp/data/model/product_model.dart';

void addToFav(ProductModel product) {
  
  if (product.isFavourite) {
    favProducts.remove(product);
  } else {
    favProducts.add(product);
  }
  product.isFavourite = !product.isFavourite;
  DbHelper.dbHelper.updateProduct(product: product);
}

addToCard(ProductModel product) {
  if (product.isCard) {
    cardProducts.remove(product);
  } else {
    cardProducts.add(product);
  }
  product.isCard = !product.isCard;
  product.quantity = product.isCard ? 1 : 0;
  
  DbHelper.dbHelper.updateProduct(product: product);
}
