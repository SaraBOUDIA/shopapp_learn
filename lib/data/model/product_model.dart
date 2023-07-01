import 'dart:io';

class ProductModel {
  late int id;
  late File image;
  late String name;
  late String pric;
  late String category;
  late bool isTop;
  late bool isFavourite;
  late bool isCard;
  late String description;
  late int quantity;
  ProductModel({
    this.id = 8,
    required this.category,
    required this.image,
    required this.name,
    required this.pric,
    this.isTop = false,
    required this.description,
    this.isCard = false,
    this.isFavourite = false,
    this.quantity = 0,
  });

  ProductModel.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    pric = json?['pric'];
    category = json?['category'];
    isTop = json?['isTop'] != 0;
    description = json?['description'];
    image = File(json?['image']) ;
    isFavourite = json?['isFavourite'] != 0;
    isCard = json?['isCard'] != 0;
    quantity = json?['quantity'];
    id = json?['id'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pric': pric,
      'image': image.path ,
      'category': category,
      'isTop': isTop,
      'description': description,
      'isCard': isCard,
      'isFavourite': isFavourite,
      'quantity': quantity,
    };
  }
}
