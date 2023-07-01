import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottie/94060-no-results-found.json'),
      ),
    );
  }
}
