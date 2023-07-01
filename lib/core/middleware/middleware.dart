// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/core/services/services.dart';

class AppMiddleware extends GetMiddleware {
  @override
  int? priority = 0;
  AppServices services = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    
    return null;
  }
}
