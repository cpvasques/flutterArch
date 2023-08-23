import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<dynamic> getSharedPreferencesKey(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.get(key);
}

Future<void> saveSharedPreferencesKey(String key, dynamic value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  if (value is int) {
    prefs.setInt(key, value);
  } else if (value is String) {
    prefs.setString(key, value);
  } else if (value is bool) {
    prefs.setBool(key, value);
  } else if (value is double) {
    prefs.setDouble(key, value);
  } else if (value is List<String>) {
    prefs.setStringList(key, value);
  } else if (value is Map) {
    final jsonString = jsonEncode(value);
    prefs.setString(key, jsonString);
  } else {
    throw UnsupportedTypeException(
        'The provided type ${value.runtimeType} is not supported.');
  }
}

Future<void> clearAllSharedPreferencesKeys() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

Future<void> removeSharedPreferencesKey(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

class UnsupportedTypeException implements Exception {
  final String message;

  UnsupportedTypeException(this.message);

  @override
  String toString() => 'UnsupportedTypeException: $message';
}
