import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileSystem {

  static Future<Map<String, dynamic>?> loadAsJsonData(String path) async {
    final file = await _loadPath(path);

    final String raw = await file.readAsString();
    if(raw.isNotEmpty)
      return jsonDecode(raw);
    return null;
  }

  static Future<File> _loadPath(String path) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File file = File("${appDocDir.path}/$path");

    if(!file.existsSync())
      return file.create();
    return file;
  }

  static void write(String path, String message) async{
    (await _loadPath(path)).writeAsString(message);
  }
}