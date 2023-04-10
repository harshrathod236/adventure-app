import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static List getListOfString(String key, [List? defValue]) {
    return _prefsInstance?.getStringList(key) ?? defValue ?? [];
  }

  static bool getBoolValue(String key, [bool? defValue]) {
    return _prefsInstance!.getBool(key) ?? defValue ?? false;
  }

  static setListOfString(String key, List<String> value) async {
    var prefs = await _instance;
    prefs.setStringList(key, value);
  }

  static setBoolValue(String key, bool value) async {
    var prefs = await _instance;
    prefs.setBool(key, value);
  }
}
