import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_downloader/config/custom_theme.dart';
import 'package:whatsapp_status_downloader/services/permission_service.dart';
import 'package:whatsapp_status_downloader/views/screens/app_infos.dart';
import 'package:whatsapp_status_downloader/views/screens/help.dart';
import 'package:whatsapp_status_downloader/views/screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PermissionService.requestStoragePermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whatsapp Status Saver',
        theme: CustomThemes.lightTheme,
        darkTheme: CustomThemes.darkTheme,
        themeMode: Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
        initialRoute: "/",
        routes: {
          "/": (context) => const Home(),
          "/help": (context) => const Help(),
          "/appinfos": (context) => const AppInfos(),
        });
  }
}
