import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/states/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

// EC444D
final themeProvider =
    StateNotifierProvider<ChangeThemeState, ThemeState>((ref) {
  return ChangeThemeState();
});

class ChangeThemeState extends StateNotifier<ThemeState> {
  bool darkMode = false;
  //final String key = "theme";
  final String prefKey = "themeKey";
  SharedPreferences? _prefs;
  ChangeThemeState() : super(ThemeState.system()) {
    log('look for the theme state');
    _loadFromPrefs();
  }

  void themeState(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        state = const ThemeState.light();
        _saveToPrefs('light');

        break;
      case ThemeMode.dark:
        state = const ThemeState.dark();
        _saveToPrefs('dark');
        break;

      default:
        _saveToPrefs('system');
        state = const ThemeState.system();
    }
  }

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    //darkMode = _prefs!.getBool(key) ?? false;
    var appstate = _prefs!.getString(prefKey);
    switch (appstate) {
      case 'light':
        state = ThemeState.light();
        break;

      case 'dark':
        state = ThemeState.dark();
        break;

      default:
        state = ThemeState.system();
    }

    // notifyListeners();
  }

  _saveToPrefs(themeState) async {
    await _initPrefs();
    //_prefs!.setBool(key, darkMode);
    _prefs!.setString(prefKey, themeState);
  }
}
