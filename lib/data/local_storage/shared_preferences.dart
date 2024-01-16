import 'package:shared_preferences/shared_preferences.dart';

class PrefKeys {
  static const String firstTime = 'first_Time';
  static const String languageCode = 'language_code';
  static const String apiTokenKey = 'apiToken';
  static const String userTaype = 'userTaype';
  static const String userName = 'userName';
  static const String userEmail = 'userEmail';
  static const String userPhone = 'userPhone';
  static const String userId = 'userId';
  static const String allowNotifications = 'allowNotifications';
  static const String available = 'available';
  static const String userPhoto = 'userPhoto';
  static const String rememberMe = 'rememberMe';
  static const String saveCardData = 'saveCardData';
  static const String profileIscomplted='profileIscomplted';
  static const String cachedUserDataModel='cachedUserDataModel';

  static const String firbaseToken='firbaseToken';
}

class Preference {
  Preference._internal();
  static late final SharedPreferences sb;
  static Future<void> init() async {
    sb = await SharedPreferences.getInstance();
  }

  static String? getString(String key) {
    try {
      return sb.getString(key);
    } catch (e) {
      return null;
    }
  }

  static int? getInt(String key) {
    try {
      return sb.getInt(key);
    } catch (e) {
      return null;
    }
  }

  static bool? getBool(String key) {
    try {
      return sb.getBool(key);
    } catch (e) {
      return null;
    }
  }

  static Future<bool> setString(String key, String value) async {
    return sb.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    return sb.setInt(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await sb.setBool(key, value);
  }

  static Future<bool?> remove(String key) async {
    return await sb.remove(key);
  }

  static Future<bool?> clear() async {
    return await sb.clear();
  }
}
