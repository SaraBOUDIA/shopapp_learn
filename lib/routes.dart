import 'package:get/get.dart';
import 'package:shopapp/core/constant/routes_name.dart';
import 'package:shopapp/view/screen/language.dart';
import 'package:shopapp/view/screen/onboardin_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.onBoarding,
    page: () => const OnBoardingScreen(),
  ),
  GetPage(
    name: AppRoute.language,
    page: () => const LanguageScreen(),
  )
];
