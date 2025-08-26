import 'dart:async';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  static final LocalStorage instance = LocalStorage._();

  static late final SharedPreferences _prefs;

  ///Initialize the local storage. Call this method before using the local storage.
  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      log('Error initializing local storage: $e');
    }
  }

  Future<void> saveBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<void> saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<void> saveStringList(String key, List<String> value) async {
    await _prefs.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }
}
