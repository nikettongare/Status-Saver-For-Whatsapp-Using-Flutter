import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<void> requestStoragePermission() async {
    bool storageStatus = await Permission.storage.isGranted;

    if (!storageStatus) {
      await Permission.storage.request();
    }
  }

  static Future<bool> checkAllFilesAccessPermission() async {
    bool allFilesAccessStatus =
        await Permission.manageExternalStorage.isGranted;

    if (allFilesAccessStatus) {
      return true;
    }
    return false;
  }

  static Future<void> requestAllFilesAccessPermission() async {
    bool allFilesAccessStatus =
        await Permission.manageExternalStorage.isGranted;

    if (!allFilesAccessStatus) {
      await [Permission.manageExternalStorage].request();
    }
  }
}
