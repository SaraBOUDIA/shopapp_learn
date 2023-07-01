// ignore_for_file: deprecated_member_use

import 'package:shopapp/controller/home/feeds_controller.dart';
import 'package:shopapp/core/constant/boxshadow.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopapp/core/constant/color.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/data/model/product_model.dart';
import 'package:shopapp/view/widget/card/buy.dart';

class ItemPage extends StatelessWidget {
  final ProductModel item;
  const ItemPage(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    FeedsControllerImp controller = Get.put(FeedsControllerImp());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ItemImage(
                item: item,
                edit: () {
                  controller.editItem(item);
                },
              ),
              Padding(
                padding: EdgeInsets.all(getWidth(20)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            itemName(context, item),
                            itemCategory(item),
                          ],
                        ),
                        const Spacer(),
                        itemPrice(context, item.pric),
                      ],
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    itemDescription(
                      item: item,
                    ),
                    Row(
                      children: [
                        Buy(
                          buy: () {},
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        addToCart(controller),
                      ],
                    ),
                    SizedBox(
                      height: getHeight(20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell addToCart(FeedsControllerImp controller) {
    return InkWell(
      onTap: () {
        controller.card(item);
        controller.update();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(40),
          vertical: getHeight(19.2),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getWidth(40)),
          color: Colors.grey[200],
        ),
        child: GetBuilder<FeedsControllerImp>(builder: (context) {
          return SvgPicture.asset(
            'assets/icons/cart-shopping-fast (${item.isCard ? 2 : 1}).svg',
            color: AppColor.primaryColor,
          );
        }),
      ),
    );
  }
}

Row itemPrice(BuildContext context, String price) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        '$price ',
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(color: Colors.black),
      ),
      Text(
        'DZD',
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(color: Colors.black87, fontSize: getWidth(22)),
      ),
    ],
  );
}

Text itemCategory(item) {
  return Text(
    item.category,
    style: TextStyle(
      fontSize: getWidth(18),
      color: AppColor.grey,
    ),
  );
}

Text itemName(BuildContext context, item) {
  return Text(
    item.name,
    style: Theme.of(context)
        .textTheme
        .displayLarge
        ?.copyWith(color: AppColor.black),
  );
}

// ignore: must_be_immutable, camel_case_types
class itemDescription extends StatelessWidget {
  final ProductModel item;
  const itemDescription({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(130),
      child: SingleChildScrollView(
        child: Text(
          item.description,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
    required this.item,
    required this.edit,
  });

  final ProductModel item;
  final Function edit;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: getHeight(400),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(getWidth(50))),
          boxShadow: shadowApp,
          image:
              DecorationImage(image: FileImage(item.image), fit: BoxFit.cover)),
      padding: EdgeInsets.all(getHeight(20)),
      child: Row(
        children: [
          const BackButton(),
          const Spacer(),
          EditButton(
            edit: () {
              edit();
            },
          ),
        ],
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    required this.edit,
    super.key,
  });
  final Function edit;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        edit();
      },
      child: const CircleAvatar(
        backgroundColor: AppColor.primaryColor,
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: CircleAvatar(
        backgroundColor: AppColor.primaryColor,
        child: SvgPicture.asset(
          'assets/icons/angle-circle-left.svg',
          color: Colors.white,
        ),
      ),
    );
  }
}
