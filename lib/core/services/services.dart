import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopapp/core/class/db_helper.dart';
import 'package:shopapp/data/datasource/products/all_products.dart';
import 'package:shopapp/data/datasource/products/card_items.dart';
import 'package:shopapp/data/datasource/products/fav_products.dart';
import 'package:shopapp/data/datasource/products/top_list.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance().then((value) {
      return value;
    });

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
  await DbHelper.dbHelper.initDataBase();
  await DbHelper.dbHelper.getAllProduct().then((value) {
    products.value = value;
    getTopProduct();
    getCardProduct();
    getFavouriteProduct();
  });
}
