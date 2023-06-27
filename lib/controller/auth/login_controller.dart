import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopapp/controller/user_controller.dart';
import 'package:shopapp/core/constant/routes.dart';
import 'package:shopapp/core/services/services.dart';
import 'package:shopapp/data/datasource/static/static.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  AppServices services = Get.find();
  final UserControllerImp _userControllerImp =
      Get.put(UserControllerImp(), permanent: true);
  @override
  login() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        services.sharedPreferences.setString('uId', value.user!.uid);
        uId = services.sharedPreferences.getString('uId')!;
        _userControllerImp.getUserData();
      });
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
