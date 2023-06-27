import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopapp/data/datasource/static/static.dart';
import 'package:shopapp/data/model/user_model.dart';

abstract class UserController extends GetxController {
  getUserData();
}

class UserControllerImp extends UserController {
  UserModel? user;
  @override
  getUserData() {
    if (user == null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .get()
          .then((value) {
        user = UserModel.fromJson(value.data());
      });
    }
  }
}
