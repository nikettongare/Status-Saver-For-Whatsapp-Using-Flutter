import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static show(String title, String msg) {
    return Get.snackbar(title, msg,
        margin: EdgeInsets.zero,
        colorText: Colors.white,
        backgroundColor: Get.theme.primaryColor,
        duration: const Duration(seconds: 3),
        borderRadius: 0,
        snackPosition: SnackPosition.BOTTOM);
  }
}
