import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/states/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

// EC444D
final themeProvider = StateNotifierProvider((ref) {
  return ChangeThemeState();
});

class ChangeThemeState extends StateNotifier<ThemeState> {
  bool darkMode = false;
  final String key = "theme";
  SharedPreferences? _prefs;
  bool? _darkTheme;
  ChangeThemeState() : super(ThemeState.system()) {
    log('look for the theme state');
    _loadFromPrefs();
    // log(darkMode.toString());
  }

  // void enableDarkMode() {
  //   darkMode = true;
  //   // state = true;
  //   // notifyListeners();
  // }

  void themeState(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        state = ThemeState.light();

        break;
      case ThemeMode.dark:
        state = ThemeState.dark();
        break;

      default:
        state = ThemeState.system();
    }
    _saveToPrefs();
  }

  // void enableLightMode() {
  //   darkMode = false;

  //   // notifyListeners();
  // }

  // toggleTheme() {
  //   darkMode = !darkMode;
  //   _saveToPrefs();
  //   // notifyListeners();
  // }

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    darkMode = _prefs!.getBool(key) ?? false;
    // notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs!.setBool(key, darkMode);
  }
}



// import 'dart:developer';

// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // EC444D
// final themeProvider = ChangeNotifierProvider.autoDispose((ref) {
//   return ChangeThemeState();
// });

// class ChangeThemeState extends ChangeNotifier {
//   bool darkMode = false;
//   final String key = "theme";
//   SharedPreferences? _prefs;
//   bool? _darkTheme;
//   ChangeThemeState() {
//     log('look for the theme state');
//     _loadFromPrefs();
//     log(darkMode.toString());
//   }

//   void enableDarkMode() {
//     darkMode = true;
//     notifyListeners();
//   }

//   void enableLightMode() {
//     darkMode = false;
//     notifyListeners();
//   }

//   toggleTheme() {
//     darkMode = !darkMode;
//     _saveToPrefs();
//     notifyListeners();
//   }

//   _initPrefs() async {
//     _prefs ??= await SharedPreferences.getInstance();
//   }

//   _loadFromPrefs() async {
//     await _initPrefs();
//     darkMode = _prefs!.getBool(key) ?? false;
//     notifyListeners();
//   }

//   _saveToPrefs() async {
//     await _initPrefs();
//     _prefs!.setBool(key, darkMode);
//   }
// }
