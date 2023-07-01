import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controller/home/feeds_controller.dart';
import 'package:shopapp/view/screen/product_details.dart';
import 'package:shopapp/view/widget/card/buy.dart';
import 'package:shopapp/view/widget/card/card_list.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FeedsControllerImp>(builder: (controller) {
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CardList(
              controller: controller,
            ),
            Column(
              children: [
                SizedBox(
                  height: Get.height * 0.7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    itemPrice(context, '${controller.cardSome()}'),
                    const SizedBox(
                      width: 30,
                    ),
                    Buy(
                      buy: () {},
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
