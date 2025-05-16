import 'package:parki_dog/core/language/language.dart';
import 'package:parki_dog/core/utils/strings_manager.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = 'prefsKeyLang';
const String userToken = 'userToken';
const String currentUser = 'currentUser';
// const String prefsKeyToken = 'prefsKeyToken';

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AppPreferences(this._sharedPreferences);

  /// Removes a value from SharedPreferences with given [key].
  Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    await _sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    await _sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  Future<dynamic> setData(String key, dynamic value) async {
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value) {
      case String value:
        await _sharedPreferences.setString(key, value);
      case int value:
        await _sharedPreferences.setInt(key, value);
      case bool value:
        await _sharedPreferences.setBool(key, value);
      case double value:
        await _sharedPreferences.setDouble(key, value);
      default:
        return null;
    }
  }

  Future<bool> getBool(String key) async {
    return _sharedPreferences.getBool(key) ?? false;
  }

  Future<double> getDouble(String key) async {
    return _sharedPreferences.getDouble(key) ?? AppDouble.d0;
  }

  Future<int> getInt(String key) async {
    return _sharedPreferences.getInt(key) ?? AppInt.i0;
  }

  Future<String> getString(String key) async {
    return _sharedPreferences.getString(key) ?? StringsManager.emptyString;
  }

  // Secure Storage related functions
  Future<void> setSecuredString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String> getSecuredString(String key) async {
    return await _secureStorage.read(key: key) ?? StringsManager.emptyString;
  }

  Future<void> clearAllSecuredData() async {
    await _secureStorage.deleteAll();
  }

  Future<void> removeSecuredData(String key) async {
    await _secureStorage.delete(key: key);
  }

  // currentUser
  Future<void> setCurrentUser(String value) async {
    await _sharedPreferences.setString(currentUser,value);
  }

  Future<String> get getCurrentUser async {
    String userId = _sharedPreferences.getString(currentUser) ?? StringsManager.emptyString;
    return userId;
  }

  /// Get App Language And Set Default Language.
  Future<String> getAppLanguage() async {
    String language = _sharedPreferences.getString(prefsKeyLang) ??
        LanguageType.english.getValue(); // default language is english
    return language;
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.italy.getValue()) {
      /// set it to english
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.english.getValue());
    } else {
      /// set it to english
      _sharedPreferences.setString(prefsKeyLang, LanguageType.italy.getValue());
    }
  }

  Future<Locale> getLocale() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.italy.getValue()) {
      return italianoLocale;
    } else {
      return englishLocale;
    }
  }

// Future<void> saveToken(String token) async{
//   _sharedPreferences.setString(prefsKeyToken, token);
// }
// Future<String?> getToken() async{
//   String? token= _sharedPreferences.getString(prefsKeyToken);
//   return token;
// }
}
