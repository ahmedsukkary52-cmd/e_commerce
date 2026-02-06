import 'package:shared_preferences/shared_preferences.dart';

import '../../api/model/request/payment/billing_data_request_dto.dart';

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

  static Future<bool> removeData({required String key}) async {
    return await _sharedPrefs.remove(key);
  }

  static Future<BillingData> getCachedBillingData() async {
    return BillingData(
      firstName:
          await SharedPrefsUtils.getData<String>(key: 'first_name') ?? '',
      lastName: await SharedPrefsUtils.getData<String>(key: 'last_name') ?? '',
      email: await SharedPrefsUtils.getData<String>(key: 'email') ?? '',
      phoneNumber: await SharedPrefsUtils.getData<String>(key: 'phone') ?? '',
    );
  }

  static Future<void> saveBillingData({
    required String firstNameValue,
    required String lastNameValue,
    required String emailValue,
    required String phoneValue,
  }) async {
    await saveData(key: 'first_name', value: firstNameValue);
    await saveData(key: 'last_name', value: lastNameValue);
    await saveData(key: 'email', value: emailValue);
    await saveData(key: 'phone', value: phoneValue);
  }
}
