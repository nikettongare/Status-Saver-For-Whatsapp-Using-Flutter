import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:whatsapp_status_downloader/services/permission_service.dart';
import 'package:whatsapp_status_downloader/views/dialogs/custom_snackbar.dart';
import 'package:whatsapp_status_downloader/views/dialogs/loading_dialog.dart';

class HomeController extends GetxController {
  String themeIcon = "dark";

  void changeThemeIcon() {
    themeIcon = Get.isDarkMode ? "light" : "dark";
    update();
  }

  bool hasAFAP = false;

  void confirmAFAP() async {
    hasAFAP = await PermissionService.checkAllFilesAccessPermission();
    if (hasAFAP) {
      fetchData();
    }
    update();
  }

  void askPermission() async {
    await PermissionService.requestAllFilesAccessPermission();
    confirmAFAP();
  }

  @override
  void onInit() {
    confirmAFAP();

    super.onInit();
  }

  List<File> images = [];
  List<File> videos = [];

  void fetchData() {
    List<File> imagesT = [];
    List<File> videosT = [];

    String path =
        "/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses";

    try {
      List<FileSystemEntity> listDir = Directory(path).listSync();
      for (var element in listDir) {
        if (element.path.split(".").last == "jpg") {
          imagesT.add(
            File(element.path),
          );
        } else if (element.path.split(".").last == "mp4") {
          videosT.add(
            File(element.path),
          );
        }
      }
      images = imagesT;
      videos = videosT;
      update();
    } catch (e) {
      CustomSnackBar.show("Error", "something went wrong");
    }
  }

  Future<void> downloadFile(File file) async {
    LoadingDialog.show();

    try {
      final value = await ImageGallerySaver.saveFile(
        file.path,
        name: "WSD-${DateTime.now()}",
        isReturnPathOfIOS: true,
      );

      if (value["isSuccess"] == true) {
        Get.back();
        CustomSnackBar.show("Download succesfully!", "Check your gallery.");
      } else {
        Get.back();
        CustomSnackBar.show("Download faild!", "try again.");
      }
    } catch (e) {
      Get.back();
      CustomSnackBar.show("Error", "something went wrong");
    }
  }
}
