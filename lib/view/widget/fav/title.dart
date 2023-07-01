import 'package:flutter/material.dart';
import 'package:shopapp/view/widget/feeds/feed/categories.dart';

Container favItem() {
  return categories(
    categories: ['Favourite'],
    currentCategory: 'Favourite',
  );
}
