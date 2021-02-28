import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Files {
  Future<File> get(String filename) async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
}
