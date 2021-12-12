import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_downloader/controller/home_controller.dart';
import 'package:whatsapp_status_downloader/views/pages/photos_page.dart';
import 'package:whatsapp_status_downloader/views/pages/videos_page.dart';
import 'package:whatsapp_status_downloader/views/widget/custom_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) {
        return SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
                drawer: const CustomDrawer(),
                drawerEdgeDragWidth: 40,
                appBar: AppBar(
                  title: const Text("Status Saver"),
                  leading: Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Image.asset(
                        "assets/menu.png",
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Get.changeThemeMode((Get.isDarkMode)
                            ? ThemeMode.light
                            : ThemeMode.dark);
                        homeController.changeThemeIcon();
                      },
                      icon: Image.asset(
                        "assets/${homeController.themeIcon}.png",
                        height: 26,
                        width: 26,
                      ),
                    ),
                  ],
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        text: "Videos Stories",
                        icon: Icon(Icons.videocam_rounded),
                      ),
                      Tab(
                        text: "Photos Stories",
                        icon: Icon(Icons.image_rounded),
                      )
                    ],
                  ),
                ),
                body: RefreshIndicator(
                  onRefresh: () async {
                    homeController.fetchData();
                  },
                  child: const TabBarView(
                    children: [
                      VideosPage(),
                      PhotosPage(),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}

                 

// CustomScrollView(
//                     slivers: [
//                       SliverToBoxAdapter(
//                         child: SizedBox(
//                           height: 60,
//                           width: double.infinity,
//                           child: ListView.builder(
//                               padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
//                               itemCount: homeController.queryList.length,
//                               scrollDirection: Axis.horizontal,
//                               itemBuilder: (context, i) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(left: 6),
//                                   child: MaterialButton(
//                                     padding: const EdgeInsets.fromLTRB(
//                                         15, 10, 15, 10),
//                                     onPressed: () {
//                                       homeController.changeQuery(
//                                           homeController.queryList[i]);
//                                     },
//                                     color: (homeController.selectedQuery ==
//                                             homeController.queryList[i])
//                                         ? Colors.blue
//                                         : Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10),
//                                         side: const BorderSide(
//                                             color: Colors.blue, width: 1)),
//                                     child: Text(
//                                       homeController.queryList[i],
//                                       style: TextStyle(
//                                           color: (homeController
//                                                       .selectedQuery ==
//                                                   homeController.queryList[i])
//                                               ? Colors.white
//                                               : Colors.black,
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                 );
//                               }),
//                         ),
//                       ),
//                       if ((homeController.images.isNotEmpty) &&
//                           (homeController.selectedQuery == "All" ||
//                               homeController.selectedQuery == "Images"))
//                         SliverPadding(
//                           padding: const EdgeInsets.all(10.0),
//                           sliver: SliverList(
//                             delegate: SliverChildBuilderDelegate(
//                               (context, i) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(bottom: 8),
//                                   child: Stack(
//                                     children: [
//                                       Image.file(
//                                         File(
//                                           homeController.images[i],
//                                         ),
//                                         fit: BoxFit.cover,
//                                         frameBuilder: (context, child, frame,
//                                             wasSynchronouslyLoaded) {
//                                           return Container(
//                                             decoration: BoxDecoration(
//                                               border: Border.all(
//                                                 width: 2,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                             child: child,
//                                           );
//                                         },
//                                         errorBuilder: (context, obj, st) {
//                                           return Container(
//                                             height: 100,
//                                             decoration: BoxDecoration(
//                                               border: Border.all(
//                                                 width: 2,
//                                                 color: Colors.black,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                             ),
//                                             child: const Text(
//                                                 "unable to show this image"),
//                                           );
//                                         },
//                                       ),
//                                       Positioned(
//                                         bottom: 3,
//                                         right: 3,
//                                         child: CustomButton(
//                                           icon: Icons.download_rounded,
//                                           onPressed: () {
//                                             homeController.downloadFile(
//                                                 homeController.images[i]);
//                                           },
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 );
//                               },
//                               childCount: homeController.images.length,
//                             ),
//                           ),
//                         ),
//                       if ((homeController.videos.isNotEmpty) &&
//                           (homeController.selectedQuery == "All" ||
//                               homeController.selectedQuery == "Videos"))
//                         SliverPadding(
//                           padding: const EdgeInsets.all(10.0),
//                           sliver: SliverList(
//                             delegate: SliverChildBuilderDelegate(
//                               (context, i) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(bottom: 8),
//                                   child: VideoPlayerService(
//                                     videoPath: homeController.videos[i],
//                                   ),
//                                 );
//                               },
//                               childCount: homeController.videos.length,
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
