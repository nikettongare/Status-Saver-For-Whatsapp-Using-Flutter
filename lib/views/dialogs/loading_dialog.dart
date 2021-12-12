import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog {
  static void show() {
    Get.dialog(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Get.theme.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
