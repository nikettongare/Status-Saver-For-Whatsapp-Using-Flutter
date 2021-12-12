import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_status_downloader/views/pages/play_video_page.dart';

class VideoPlayerService extends StatefulWidget {
  final File file;
  const VideoPlayerService({required this.file, Key? key}) : super(key: key);

  @override
  _VideoPlayerServiceState createState() => _VideoPlayerServiceState();
}

class _VideoPlayerServiceState extends State<VideoPlayerService> {
  late VideoPlayerController _playerController;

  @override
  void initState() {
    _playerController = VideoPlayerController.file(widget.file)..initialize();
    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlayVideoPage(
                  playerController: _playerController,
                  file: widget.file,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: VideoPlayer(_playerController),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayVideoPage(
                    playerController: _playerController,
                    file: widget.file,
                  ),
                ),
              );
            },
            color: Colors.white,
            iconSize: 40,
            icon: const Icon(
              Icons.play_arrow_rounded,
            ),
          ),
        ),
      ],
    );
  }
}
