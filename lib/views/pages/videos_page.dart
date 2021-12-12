import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_downloader/controller/home_controller.dart';
import 'package:whatsapp_status_downloader/views/widget/video_player_service.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return RefreshIndicator(
            onRefresh: () async {
              homeController.fetchData();
            },
            color: Colors.white,
            child: (homeController.hasAFAP)
                ? (homeController.videos.isNotEmpty)
                    ? GridView.builder(
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 250,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 260),
                        itemCount: homeController.videos.length,
                        itemBuilder: (context, i) {
                          return VideoPlayerService(
                            file: homeController.videos[i],
                          );
                        })
                    : Center(
                        child: SizedBox(
                          width: 280,
                          child: ListView(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              Text(
                                "No stories found!",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline1,
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                "Goto whatsapp and view some stories\nTHEN\nPull down to refresh.",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2,
                              ),
                            ],
                          ),
                        ),
                      )
                : SingleChildScrollView(
                    child: Center(
                      child: SizedBox(
                        width: 280,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                            Text(
                              "Application need permission to access files.",
                              textAlign: TextAlign.center,
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                            MaterialButton(
                              onPressed: () {
                                homeController.askPermission();
                              },
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                              child: Text(
                                "Grant Permissions",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        });
  }
}
