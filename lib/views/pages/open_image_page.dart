import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:whatsapp_status_downloader/controller/home_controller.dart';
import 'package:whatsapp_status_downloader/views/widget/action_button.dart';

class OpenImagePage extends StatelessWidget {
  final File file;
  const OpenImagePage({required this.file, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  SizedBox.expand(
                    child: InteractiveViewer(
                      child: Image.file(
                        file,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: ActionButton(
                      icon: Icons.keyboard_arrow_left_rounded,
                      size: 34,
                      toolTip: "Back",
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Positioned(
                    right: 70,
                    top: 10,
                    child: ActionButton(
                      icon: Icons.download_rounded,
                      size: 28,
                      toolTip: "Download",
                      onPressed: () {
                        homeController.downloadFile(file);
                      },
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: ActionButton(
                      icon: Icons.share_rounded,
                      size: 26,
                      toolTip: "Share",
                      onPressed: () async {
                        await Share.shareFiles([file.path],
                            text: "Status Saver For Whatsapp");
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
