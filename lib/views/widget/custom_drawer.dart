import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_downloader/controller/home_controller.dart';
import 'package:whatsapp_status_downloader/views/dialogs/exit_dialog.dart';
import 'package:whatsapp_status_downloader/views/widget/drawer_listtile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) {
        return SizedBox(
          width: 250,
          child: Drawer(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 30),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/applogo.png",
                          height: 50,
                          width: 50,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Status\nSaver",
                        style: Theme.of(context).primaryTextTheme.headline2,
                      )
                    ],
                  ),
                ),
                drawerListTile(
                    onPressed: () async {
                      await Navigator.pushReplacementNamed(context, "/");
                    },
                    text: "Home",
                    icon: "home"),
                drawerListTile(
                    onPressed: () async {
                      Get.back();
                      await Navigator.pushNamed(context, "/help");
                    },
                    text: "Help",
                    icon: "help"),
                drawerListTile(
                    onPressed: () {
                      Get.changeThemeMode(
                          (Get.isDarkMode) ? ThemeMode.light : ThemeMode.dark);
                      homeController.changeThemeIcon();
                    },
                    text: "Dark Mode",
                    icon: homeController.themeIcon),
                // drawerListTile(onPressed: () {}, text: "Share", icon: "share"),
                // drawerListTile(
                //     onPressed: () {}, text: "Rate Us", icon: "rateus"),
                drawerListTile(
                    onPressed: () async {
                      Get.back();
                      await Navigator.pushNamed(context, "/appinfos");
                    },
                    text: "App Infos",
                    icon: "info"),
                drawerListTile(
                    onPressed: () {
                      Get.back();
                      ExitDialog.show();
                    },
                    text: "Exit",
                    icon: "exit"),
              ],
            ),
          ),
        );
      },
    );
  }
}
