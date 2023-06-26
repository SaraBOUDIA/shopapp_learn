
import 'package:get/get.dart';

class OnBoardController extends GetxController {
  int currentPage = 0;

  void pageChanged(int value) {
    currentPage = value;
    update();
  }

  void nextPage() {}
}

class OnBoardingControllerImplement extends OnBoardController {
}
