import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controller/home/feeds_controller.dart';
import 'package:shopapp/core/constant/routes.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/data/datasource/products/all_products.dart';
import 'package:shopapp/data/datasource/products/categories.dart';
import 'package:shopapp/data/datasource/products/top_list.dart';
import 'package:shopapp/view/widget/feeds/feed/banner.dart';
import 'package:shopapp/view/widget/feeds/feed/categories.dart';
import 'package:shopapp/view/widget/feeds/feed/gridshow.dart';
import 'package:shopapp/view/widget/feeds/feed/search_bar.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FeedsControllerImp());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(20), vertical: getHeight(20)),
        child: GetBuilder<FeedsControllerImp>(builder: (controller) {
          return Column(
            children: [
              SearchBarApp(
                controller: controller.searchController,
                search: (key) {
                  controller.search(key);
                  Get.toNamed(AppRoute.search);
                },
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      banners(
                        topList: topProduts,
                        pageController: controller.pageController,
                        currentPage: controller.currentBannerPage,
                        onChange: (p0) {
                          controller.changeBnnerPage(p0);
                        },
                        onTap: (item) {
                          controller.showProduct(item);
                        },
                      ),
                      SizedBox(
                        height: getHeight(35),
                      ),
                      categories(
                        categories: categoriesList,
                        currentCategory: categoriesList[0],
                      ),
                      SizedBox(
                        height: getHeight(12),
                      ),
                      itemShowGrid(
                        fav: (item) {
                          controller.fav(item);
                        },
                        products: products,
                        onTap: (item) {
                          controller.showProduct(item);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
