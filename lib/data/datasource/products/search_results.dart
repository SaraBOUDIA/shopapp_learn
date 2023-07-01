import 'package:shopapp/core/functions/iscontain_ingcase.dart';
import 'package:shopapp/data/datasource/products/all_products.dart';
import 'package:shopapp/data/model/product_model.dart';

List<ProductModel> searchResults = [];

Future<List<ProductModel>> getSearchResults(String keyWord) async {
  List<ProductModel> tmp = [];
  for (var element in products) {
    if (containsIgnoreCase(element.category, keyWord) ||
        containsIgnoreCase(element.name, keyWord) ||
        containsIgnoreCase(element.description, keyWord)) {
      tmp.add(element);
    }
  }
  return tmp;
}
