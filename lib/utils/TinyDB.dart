import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TinyDB {
  static TinyDB? _instance;
  static SharedPreferences? _prefs;

  static Future<TinyDB?> getInstance() async {
    if (_instance == null) {
      _instance = TinyDB._();
      _prefs = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  TinyDB._();

  Future<bool> putString(String key, String value) async {
    return _prefs!.setString(key, value);
  }

  String getString(String key, {String defValue = ''}) {
    return _prefs!.getString(key) ?? defValue;
  }

  Future<bool> putInt(String key, int value) async {
    return _prefs!.setInt(key, value);
  }

  int getInt(String key, {int defValue = 0}) {
    return _prefs!.getInt(key) ?? defValue;
  }

  Future<bool> putDouble(String key, double value) async {
    return _prefs!.setDouble(key, value);
  }

  double getDouble(String key, {double defValue = 0.0}) {
    return _prefs!.getDouble(key) ?? defValue;
  }

  Future<bool> putBool(String key, bool value) async {
    return _prefs!.setBool(key, value);
  }

  bool getBool(String key, {bool defValue = false}) {
    return _prefs!.getBool(key) ?? defValue;
  }

  Future<bool> putList(String key, List<dynamic> list) async {
    String value = jsonEncode(list);
    return _prefs!.setString(key, value);
  }

  List<dynamic> getList(String key) {
    String value = _prefs!.getString(key);
    return value == null ? null : jsonDecode(value);
  }

  Future<bool> putMap(String key, Map<String, dynamic> map) async {
    String value = jsonEncode(map);
    return _prefs!.setString(key, value);
  }

  Map<String, dynamic> getMap(String key) {
    String value = _prefs!.getString(key);
    return value == null ? null : jsonDecode(value);
  }
}
