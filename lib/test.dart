import 'package:flutter/material.dart';
import 'package:shopapp/core/constant/color.dart';
import 'package:shopapp/core/functions/check_net.dart';
import 'package:shopapp/core/functions/dimensions.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  Future<bool?>? res;
  initialData() async {
    res = checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: AppColor.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
          child: MaterialButton(
            onPressed: () async {
              await initialData();
            },
            child: const Text('Arabic'),
          ),
        ),
      ),
    );
  }
}
