import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// EC444D
final changeTheme = ChangeNotifierProvider.autoDispose((ref) {
  return ChangeThemeState();
});

class ChangeThemeState extends ChangeNotifier {
  bool darkMode = false;
  final String key = "theme";
  SharedPreferences? _prefs;
  bool? _darkTheme;
  ChangeThemeState() {
    log('look for the theme state');
    _loadFromPrefs();
    log(darkMode.toString());
  }

  void enableDarkMode() {
    darkMode = true;
    notifyListeners();
  }

  void enableLightMode() {
    darkMode = false;
    notifyListeners();
  }

  toggleTheme() {
    darkMode = !darkMode;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    darkMode = _prefs!.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs!.setBool(key, darkMode);
  }
}
