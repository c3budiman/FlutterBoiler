import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferencesUtils {
  ///Save data to Shared Preferences as String
  static Future saveData(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  ///Save data to Shared Preferences as Integer
  static Future saveDataInt(String key, int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, data);
  }

  ///Save data to Shared Preferences as List String
  static Future saveDataList(String key, List<String> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, data);
  }

  ///LIST DYNAMIC TO JSON
  static Future saveDataToJSON(String key, List data) async {
    var encoded = json.encode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, encoded);
  }

  ///Get data From decoded JSON from Shared Preferences
  static getDataFromJson(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) != null) {
      String? _data = prefs.getString(key);
      if (_data is String) {
        return json.decode(_data);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  ///Get data String from Shared Preferences
  static Future<String> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // return prefs.getString(key);
    if (prefs.getString(key) != null) {
      String? _data = prefs.getString(key);
      if (_data is String) {
        return _data;
      } else {
        return "";
      }
    } else {
      return "";
    }
  }

  ///Remove Shared Preferences Data
  static removeData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
