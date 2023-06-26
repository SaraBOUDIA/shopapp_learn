import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<SharedPrefServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => SharedPrefServices().init());
}
