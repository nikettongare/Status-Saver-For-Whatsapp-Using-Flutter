import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_downloader/controller/home_controller.dart';
import 'package:whatsapp_status_downloader/views/pages/open_image_page.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({Key? key}) : super(key: key);

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
                ? (homeController.images.isNotEmpty)
                    ? GridView.builder(
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                        ),
                        itemCount: homeController.images.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OpenImagePage(
                                    file: homeController.images[i],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: FileImage(
                                        homeController.images[i],
                                      ),
                                      fit: BoxFit.cover)),
                            ),
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
