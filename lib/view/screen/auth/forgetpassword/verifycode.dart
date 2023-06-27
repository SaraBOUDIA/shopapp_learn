import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopapp/controller/auth/verifycode_controller.dart';
import 'package:shopapp/core/constant/routes.dart';

import 'package:shopapp/view/widget/auth/customtexttitleauth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 6),
      () {
        Get.offAllNamed(AppRoute.login);
      },
    );
    return Scaffold(
        body: Center(
      child: Column(children: [
        const SizedBox(height: 20),
        const CustomTextTitleAuth(text: "Check your email"),
        const SizedBox(height: 10),
        Lottie.network(
            'https://assets9.lottiefiles.com/packages/lf20_NL9znD.json'),
      ]),
    ));
  }
}
