import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExitDialog {
  static void show() {
    Get.dialog(
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              width: 260,
              height: 124,
              decoration: BoxDecoration(
                color: Get.theme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    "Are you sure you wish to exit from app?",
                    textAlign: TextAlign.center,
                    style: Get.theme.primaryTextTheme.headline2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: Text(
                          "Yes",
                          style: Get.theme.primaryTextTheme.headline2,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "No",
                          style: Get.theme.primaryTextTheme.headline2,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
