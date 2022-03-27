import 'package:shared_preferences/shared_preferences.dart';

const String DEFAULT_URL = "192.168.178.30";
const int DEFAULT_PORT = 8080;

class Preferences {

  static bool loaded = false;
  static late SharedPreferences _preferences;

  static Future<void> preload() async {
    if(!loaded) {
      _preferences = await SharedPreferences.getInstance();
      loaded = true;
    }
  }

  static void setUrl(String url) async => await _preferences.setString("url", url);


  static String getUrl() => _preferences.getString("url") ?? DEFAULT_URL;

  static void setPort(int port) async => await _preferences.setInt("port", port);

  static int getPort() => _preferences.getInt("port") ?? DEFAULT_PORT;

}