import 'dart:convert';

import 'package:shared_preference1/models/user2_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefer {

  static storeExploiter(Exploiter exploiter) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringExploiter = jsonEncode(exploiter);
    prefs.setString("exploiter", stringExploiter);
  }

  static Future<Exploiter?> loadExploiter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringExploiter = prefs.getString("exploiter");
    if (stringExploiter == null || stringExploiter.isEmpty) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(stringExploiter);
    return Exploiter.fromJson(map);
  }

  static Future<bool> removeExploiter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("exploiter");
  }
}