import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  Future<SharedPreferences>? _sharedPreference;
  static const String isDarkModeKey = "is_dark_mode";

  SharedPreferenceHelper() {
    _sharedPreference = SharedPreferences.getInstance();
  }

  //Theme module
  Future<void> changeTheme(bool value) {
    return _sharedPreference!
        .then((prefs) => prefs.setBool(isDarkModeKey, value));
  }

  Future<bool> get isDarkMode {
    return _sharedPreference!
        .then((prefs) => prefs.getBool(isDarkModeKey) ?? false);
  }
}
