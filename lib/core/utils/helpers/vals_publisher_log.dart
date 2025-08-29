import 'package:shared_preferences/shared_preferences.dart';

class ValsPublisherLog {
  static const _key = 'last_published_val';

  static Future<void> set(String value) async {
    final prefs = await SharedPreferences.getInstance();
    final timestamp = DateTime.now().toIso8601String();
    final entry = '[$timestamp] $value';
    await prefs.setString(_key, entry);
  }

  static Future<String?> get() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
