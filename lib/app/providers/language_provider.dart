import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final lang = StateNotifierProvider<AppLanguage, Locale>((refrence) {
  return AppLanguage();
});

class AppLanguage extends StateNotifier<Locale> {
  Locale _appLocale = Locale('ar');

  AppLanguage() : super(Locale('en')) {
    fetchLocale();
  }

  // Locale get appLocal =>
  //     _appLocale; // TODO changes after null safe ?? Locale("en");
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('ar');
      state = Locale('ar');
      return null;
    }
    state = Locale(prefs.getString('language_code')!);
    return null;
  }

  void toggleLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (state == Locale("en")) {
      state = Locale("ar");
      // _appLocale = Locale("ar");
      await prefs.setString('language_code', 'ar');
      // await prefs.setString('countryCode', '');
    } else {
      // _appLocale = Locale("en");
      state = Locale("en");

      await prefs.setString('language_code', 'en');
      // await prefs.setString('countryCode', 'US');
    }
    log(state.toString());
    // notifyListeners();
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (state == type) {
      return;
    }
    if (type == Locale("ar")) {
      _appLocale = Locale("ar");
      state = Locale("ar");
      // await prefs.setString('language_code', 'ar');
      // await prefs.setString('countryCode', '');
    } else {
      state = Locale("en");
      _appLocale = Locale("en");
      // await prefs.setString('language_code', 'en');
      // await prefs.setString('countryCode', 'US');
    }
    // notifyListeners();
  }
}
