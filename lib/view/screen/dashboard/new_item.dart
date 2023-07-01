import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controller/dashboard/dashboard_controller.dart';
import 'package:shopapp/core/functions/dimensions.dart';
import 'package:shopapp/core/functions/validinput.dart';
import 'package:shopapp/view/widget/dashboard/product_image.dart';
import 'package:shopapp/view/widget/dashboard/submite.dart';
import 'package:shopapp/view/widget/dashboard/textfiled_product.dart';

class NewItemScreen extends GetView<DashboardControllerImp> {
  const NewItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardControllerImp controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(12),
          vertical: getHeight(6),
        ),
        child: Form(
          key: controller.key,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(12),
              ),
              Row(
                children: [
                  Expanded(
                    child: ProductTextFiled(
                      assetName: 'assets/icons/box-open.svg',
                      valid: (p0) {
                        return validInput(p0, 3, 20, 'product');
                      },
                      controller: controller.name,
                      hint: 'Product Name',
                    ),
                  ),
                  SizedBox(
                    width: getWidth(8),
                  ),
                  Expanded(
                    child: ProductTextFiled(
                      assetName: 'assets/icons/tags.svg',
                      valid: (p0) {
                        return validInput(p0, 1, 8, 'price');
                      },
                      controller: controller.pric,
                      hint: 'Product Price',
                      type: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(12),
              ),
              ProductTextFiled(
                assetName: 'assets/icons/box-open (description).svg',
                valid: (p0) {
                  return validInput(p0, 1, 1000, 'product');
                },
                controller: controller.description,
                min: 2,
                max: 12,
                hint: 'Product Description',
              ),
              Text(
                'Product Image :',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getWidth(20),
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                  onPressed: () {
                    controller.getImage();
                  },
                  icon: const Icon(Icons.camera_alt)),
              SizedBox(
                height: getHeight(8),
              ),
              GetBuilder<DashboardControllerImp>(builder: (controller) {
                return ProductImage(
                  image: controller.currentPostFile,
                );
              }),
              SizedBox(
                height: getHeight(15),
              ),
              GetBuilder<DashboardControllerImp>(builder: (controller) {
                return checkIsTop(
                  value: controller.isTop,
                  onClick: () {
                    controller.isTopClicked();
                  },
                );
              }),
              // const Spacer(),
              addNowButton(() {
                if (controller.key.currentState?.validate() != true) {
                  Get.defaultDialog(
                    title: 'Error',
                    middleText: 'Make sure you inpute all information',
                    textConfirm: 'Ok',
                    onConfirm: () {
                      Get.back();
                    },
                  );
                } else {
                  if (controller.currentPostFile == null) {
                    Get.defaultDialog(
                      title: 'Error',
                      middleText: 'Make sure you uplad a picture for Product',
                      textConfirm: 'Ok',
                      onConfirm: () {
                        Get.back();
                      },
                    );
                  } else {
                    controller.addProduct();
                  }
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
