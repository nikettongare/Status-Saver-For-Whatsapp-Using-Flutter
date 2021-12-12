import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_status_downloader/views/dialogs/custom_snackbar.dart';

class AppInfos extends StatefulWidget {
  const AppInfos({Key? key}) : super(key: key);

  @override
  State<AppInfos> createState() => _AppInfosState();
}

class _AppInfosState extends State<AppInfos> {
  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    _initPackageInfo();
    super.initState();
  }

  Future<void> _initPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            ClipOval(
              child: Image.asset(
                "assets/applogo.png",
                height: 100,
                width: 100,
              ),
            ),
            Text(
              "Status Saver",
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
            Text(
              packageInfo.version,
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 120,
              child: MaterialButton(
                onPressed: () async {
                  bool res =
                      await launch("https://www.fiverr.com/share/EjGDyy");

                  if (!res) {
                    CustomSnackBar.show("Error", "Something want wrong!");
                  }
                },
                minWidth: 120,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                child: Center(
                  child: Text(
                    "Hire Me",
                    style: Theme.of(context).primaryTextTheme.headline2,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              "Made With Love",
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        )),
      ),
    );
  }
}
