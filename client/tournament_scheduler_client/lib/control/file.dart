import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileSystem {

  static loadAsJsonData(String path) {
      return _loadPath(path).then((file) {

        String raw = file.readAsStringSync();

        if(raw.isNotEmpty)
          return jsonDecode(raw);
        else
          return [];
      });
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