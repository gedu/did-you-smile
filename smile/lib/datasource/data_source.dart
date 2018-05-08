import 'dart:async';
import 'dart:io';

abstract class DataSource {

  Future<File> saveJson(String json);

  Future<String> loadJson();
}