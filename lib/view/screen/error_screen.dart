import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopapp/core/functions/dimensions.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  const ErrorScreen({required this.errorMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getWidth(40), vertical: getHeight(45)),
          child: ListView(
            children: [
              Text(
                errorMessage,
                style: TextStyle(
                  fontSize: getHeight(18),
                  fontWeight: FontWeight.w300,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(
                height: getHeight(40),
              ),
              Lottie.network(
                  'https://assets4.lottiefiles.com/packages/lf20_awxs6x6k.json'),
              SizedBox(
                height: getHeight(45),
              ),
              Container(
                color: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: MaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
