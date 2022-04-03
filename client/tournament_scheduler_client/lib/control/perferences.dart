import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const String DEFAULT_URL = "192.168.178.30";
const int DEFAULT_PORT = 8080;

class Preferences {
  static bool _loaded = false;
  static late SharedPreferences _preferences;
  static late Map<String, List<String>> _permissionKeys;

  static const String PERMISSION_KEYS = "permissionKeys";
  static const String URL = "url";
  static const String PORT = "port";

  static Future<void> preload() async {
    if (!_loaded) {
      _loaded = true;
      _preferences = await SharedPreferences.getInstance();

      final Map<String, dynamic> temp = jsonDecode(_preferences.getString(PERMISSION_KEYS) ?? "{}");
      _permissionKeys = Map();

      temp.forEach((key, value) {
        List<String> list = [];
        for(dynamic x in (value as List<dynamic>) ) {
          list.add(x.toString());
        }
        _permissionKeys[key] = list;
      });
    }
  }

  static void setUrl(String url) async =>
      await _preferences.setString(URL, url);

  static String getUrl() => _preferences.getString(URL) ?? DEFAULT_URL;

  static void setPort(int port) async => await _preferences.setInt(PORT, port);

  static int getPort() => _preferences.getInt(PORT) ?? DEFAULT_PORT;

  static void addPermissionKey(String key, String permissionKey) =>
      addPermissionKeys(key, [permissionKey]);

  static void addPermissionKeys(String key, List<String> permissionKeys) {
    _permissionKeys.putIfAbsent(key, () => []);
    _permissionKeys[key]?.addAll(permissionKeys);
    _preferences.setString(PERMISSION_KEYS, jsonEncode(_permissionKeys));
  }

  static void removePermissionKey(String key, String permissionKey) {
    _permissionKeys[key]?.remove(permissionKey);
  }

  static void removePermissionKeys(String key) {
    _permissionKeys.remove(key);
  }

  static List<String> getPermissionKeys(String key) {
    return _permissionKeys[key] ?? [];
  }
}
