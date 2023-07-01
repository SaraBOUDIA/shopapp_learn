import 'package:get/get.dart';
import 'package:shopapp/core/constant/routes.dart';
import 'package:shopapp/view/screen/dashboard/dashboard_home.dart';
import 'package:shopapp/view/screen/home_screen.dart';
import 'package:shopapp/view/screen/search_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: '/',
    page: (() => const HomeScreen()),
  ),
  GetPage(
    name: AppRoute.search,
    page: () => const SearchScreen(),
  ),
  // GetPage(

  //   arguments: [],
  //   name: AppRoute.edit,
  //   page: () =>  EditItemScreen(product: pr,),
  // ),
  GetPage(
    name: AppRoute.dashBoard,
    page: () => const DashboardHome(),
  )
];
