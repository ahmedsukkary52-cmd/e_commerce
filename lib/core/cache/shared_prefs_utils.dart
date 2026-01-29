import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {
  static late SharedPreferences _sharedPrefs;

  static Future<SharedPreferences> init() async {
    return _sharedPrefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is int) {
      return await _sharedPrefs.setInt(key, value);
    } else if (value is double) {
      return await _sharedPrefs.setDouble(key, value);
    } else if (value is String) {
      return await _sharedPrefs.setString(key, value);
    } else if (value is List<String>) {
      return await _sharedPrefs.setStringList(key, value);
    } else {
      return await _sharedPrefs.setBool(key, value);
    }
  }

  static Future<T?> getData<T>({required String key}) async {
    return _sharedPrefs.get(key) as T?;
  }

  // static Object? getData({required String key})async{
  //   return _sharedPrefs.get(key);
  // }

  static Future<bool> removeData({required String key}) async {
    return await _sharedPrefs.remove(key);
  }
}
