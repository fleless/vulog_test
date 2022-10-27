import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vulog_technical_test/utils/shared_preference_helper.dart';

class ThemeProvider extends ChangeNotifier {
  // shared pref object
  final _sharedPrefsHelper = Modular.get<SharedPreferenceHelper>();

  bool _isDarkModeOn = false;

  ThemeProvider();

  bool get isDarkModeOn {
    _sharedPrefsHelper.isDarkMode.then((statusValue) {
      _isDarkModeOn = statusValue;
    });

    return _isDarkModeOn;
  }

  void updateTheme(bool isDarkModeOn) {
    _sharedPrefsHelper.changeTheme(isDarkModeOn);
    _sharedPrefsHelper.isDarkMode.then((darkModeStatus) {
      _isDarkModeOn = darkModeStatus;
    });

    notifyListeners();
  }
}
