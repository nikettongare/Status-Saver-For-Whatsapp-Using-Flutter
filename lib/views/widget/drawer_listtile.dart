import 'package:flutter/material.dart';
import 'package:get/get.dart';

ListTile drawerListTile(
    {required VoidCallback onPressed,
    required String text,
    required String icon}) {
  return ListTile(
    onTap: onPressed,
    title: Text(
      text,
      style: Get.theme.primaryTextTheme.headline2,
    ),
    leading: Image.asset(
      "assets/$icon.png",
      height: 28,
      width: 28,
    ),
  );
}
