import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../datasource/data_source.dart';

class FileDataSource extends DataSource {

  static const SMILE_FILE_NAME = "smile.txt";

  Future<String> get _directoryPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _directoryPath;
    return File('$path/$SMILE_FILE_NAME');
  }

  @override
  Future<File> saveJson(String json) async {
    final file = await _localFile;
    return file.writeAsString(json);
  }

  @override
  Future<String> loadJson() async {
    try {
      final file = await _localFile;
      final content = await file.readAsString();

      return content;
    } catch (e) {
      return "";
    }
  }
}