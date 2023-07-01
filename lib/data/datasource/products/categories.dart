import 'package:shopapp/data/datasource/products/all_products.dart';
import 'package:shopapp/data/model/product_model.dart';

List<String> categoriesList = [
  'Products',
];

Future<List<ProductModel>> categoryProducts(String category) async {
  List<ProductModel> tmp = [];
  if (category != 'All') {
    for (var element in products) {
      if (element.category == category) {
        tmp.add(element);
      }
    }
    return tmp;
  }
  return tmp;
}
