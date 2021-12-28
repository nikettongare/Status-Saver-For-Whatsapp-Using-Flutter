import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<bool> updatePref(Uri prefURI) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString("prefURI", prefURI.toString());
  }

  static Future<Uri> fetchPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString("prefURI");
    return Uri.parse(result!);
  }
}
