import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopapp/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopapp/data/model/user_model.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  @override
  signUp() {
    if (formstate.currentState!.validate()) {
      Get.toNamed(AppRoute.loading);
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      )
          .then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(value.user?.uid)
            .set(UserModel(
              email: email.text,
              name: username.text,
              phone: phone.text,
              uId: value.user?.uid,
            ).toMap());
        Get.offAllNamed(AppRoute.successSignUp);
      }).onError(
        (error, stackTrace) {
          Get.offNamed(AppRoute.signUp);
        },
      );
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
