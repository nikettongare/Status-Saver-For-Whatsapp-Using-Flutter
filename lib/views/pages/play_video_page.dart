import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_status_downloader/controller/home_controller.dart';
import 'package:whatsapp_status_downloader/views/widget/action_button.dart';

class PlayVideoPage extends StatefulWidget {
  final VideoPlayerController playerController;
  final File file;
  const PlayVideoPage(
      {required this.playerController, required this.file, Key? key})
      : super(key: key);

  @override
  State<PlayVideoPage> createState() => _PlayVideoPageState();
}

class _PlayVideoPageState extends State<PlayVideoPage> {
  IconData playButton = Icons.pause_rounded;

  @override
  void initState() {
    widget.playerController.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return WillPopScope(
            onWillPop: () async {
              widget.playerController.pause();
              return true;
            },
            child: SafeArea(
              child: Scaffold(
                body: Stack(
                  children: [
                    SizedBox.expand(
                      child: VideoPlayer(widget.playerController),
                    ),
                    Positioned(
                      bottom: 10,
                      left: (MediaQuery.of(context).size.width / 2) - 45,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            if (playButton == Icons.play_arrow_rounded) {
                              widget.playerController.play();
                              playButton = Icons.pause_rounded;
                            } else {
                              widget.playerController.pause();
                              playButton = Icons.play_arrow_rounded;
                            }
                          });
                        },
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                        child: Icon(
                          playButton,
                          size: 34,
                          color: Colors.white,
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
                          widget.playerController.pause();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Positioned(
                      right: 70,
                      top: 10,
                      child: ActionButton(
                        icon: Icons.download_rounded,
                        toolTip: "Download",
                        size: 28,
                        onPressed: () {
                          homeController.downloadFile(widget.file);
                        },
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: ActionButton(
                        icon: Icons.share_rounded,
                        toolTip: "Share",
                        size: 26,
                        onPressed: () async {
                          await Share.shareFiles([widget.file.path],
                              text: "Status Saver For Whatsapp");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
