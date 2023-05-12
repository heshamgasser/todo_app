import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  String language = 'en';

  void changeLanguage(String lang) {
    language = lang;
    notifyListeners();
  }
}
