import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopapp/controller/home/feeds_controller.dart';
import 'package:shopapp/data/datasource/products/search_results.dart';
import 'package:shopapp/view/widget/feeds/feed/search_bar.dart';
import 'package:shopapp/view/widget/search/result_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedsControllerImp>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.searchEnd();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                    child: SearchBarApp(
                      controller: controller.searchController,
                      search: (key) {
                        controller.search(key);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              if (searchResults.isNotEmpty)
                Expanded(
                  child: SearchList(
                    controller: controller,
                  ),
                ),
              if (searchResults.isEmpty)
                Center(
                    child: Lottie.asset(
                        'assets/lottie/94060-no-results-found.zip')),
            ],
          ),
        ),
      ));
    });
  }
}
