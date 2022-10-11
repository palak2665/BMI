import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  final SharedPreferences sharedPreferences;
  ThemeChanger(this.sharedPreferences);
  static const darkThemeKey = "dark_theme";

  bool _darktheme = true;
  set darkTheme(bool value) {
    _darktheme = value;
    sharedPreferences.setBool(darkThemeKey, value);
    notifyListeners();
  }

  bool get darkTheme => sharedPreferences.getBool(darkThemeKey) ?? _darktheme;
}
