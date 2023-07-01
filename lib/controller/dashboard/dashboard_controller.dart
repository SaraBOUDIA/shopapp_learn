import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopapp/core/class/db_helper.dart';
import 'package:shopapp/data/datasource/products/all_products.dart';
import 'package:shopapp/data/datasource/products/card_items.dart';
import 'package:shopapp/data/datasource/products/fav_products.dart';
import 'package:shopapp/data/datasource/products/top_list.dart';
import 'package:shopapp/data/model/product_model.dart';

abstract class DashboardController extends GetxController {
  isTopClicked();
  addProduct();
}

class DashboardControllerImp extends DashboardController {
  late TextEditingController name;
  late TextEditingController pric;
  late TextEditingController description;
  late GlobalKey<FormState> key;
  late bool isTop;

  @override
  isTopClicked() {
    isTop = !isTop;
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    pric = TextEditingController();
    description = TextEditingController();
    key = GlobalKey<FormState>();
    isTop = false;
    super.onInit();
  }

  @override
  addProduct() {
    ProductModel product = ProductModel(
      category: 'Product',
      image: currentPostFile!,
      name: name.text,
      pric: pric.text,
      description: description.text,
      isTop: isTop,
    );
    products.add(product);
    if (isTop) topProduts.add(product);

    DbHelper.dbHelper.insertNewProduct(product: product).then((value) {
      Get.snackbar('Success', 'The Product is created',
          duration: const Duration(seconds: 1));
    });
    Get.back();
  }

  File? currentPostFile;

  var picker = ImagePicker();
  void getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      currentPostFile = File(pickedFile.path);
    }
    update();
  }
}

class EditItemController extends DashboardController {
  late TextEditingController name;
  late TextEditingController pric;
  late TextEditingController description;
  late GlobalKey<FormState> key;
  ProductModel product;
  EditItemController({required this.product});
  late bool isTop;

  @override
  isTopClicked() {
    isTop = !isTop;
    update();
  }

  @override
  void onInit() {
    key = GlobalKey<FormState>();
    name = TextEditingController(text: product.name);
    pric = TextEditingController(text: product.pric);
    description = TextEditingController(text: product.description);
    isTop = product.isTop;
    currentPostFile = product.image;
    super.onInit();
  }

  @override
  addProduct() {
    ProductModel editedProduct = ProductModel(
      category: 'Product',
      image: currentPostFile!,
      name: name.text,
      pric: pric.text,
      description: description.text,
      isTop: isTop,
      quantity: product.quantity,
      isCard: product.isCard,
      isFavourite: product.isFavourite,
      id: product.id,
    );
    products.add(editedProduct);
    products.remove(product);
    topProduts.add(editedProduct);
    topProduts.remove(product);
    if (product.isFavourite) {
      favProducts.add(editedProduct);
      favProducts.remove(product);
    }
    if (product.isCard) {
      cardProducts.add(editedProduct);
      cardProducts.remove(product);
    }

    DbHelper.dbHelper.updateProduct(product: editedProduct).then((value) {
      Get.snackbar('Success', 'The Product is updated',
          duration: const Duration(seconds: 1));
      Get.toNamed('/');
      Get.delete<EditItemController>();
    });
  }

  File? currentPostFile;

  var picker = ImagePicker();
  void getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      currentPostFile = File(pickedFile.path);
    }
    update();
  }

  void deletProduct(ProductModel product) {
    Get.defaultDialog(
        title: 'Confirm deleting',
        middleText: 'Are you sure you want to delete this product !',
        textConfirm: 'Confirm',
        confirmTextColor: Colors.white,
        onCancel: () {},
        onConfirm: () {
          products.remove(product);
          if (product.isCard) cardProducts.remove(product);
          if (product.isTop) topProduts.remove(product);
          if (product.isFavourite) favProducts.remove(product);
          DbHelper.dbHelper.deleteProduct(product: product).then((value) {
            Get.snackbar('Success', 'The Product is deleted',
                duration: const Duration(seconds: 1));
            Get.toNamed('/');
            Get.delete<EditItemController>();
          });
        });
  }
}
