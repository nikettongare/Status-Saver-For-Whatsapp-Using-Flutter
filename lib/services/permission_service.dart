import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<void> requestStoragePermission() async {
    bool storageStatus = await Permission.storage.isGranted;

    if (!storageStatus) {
      await Permission.storage.request();
    }
  }
}
