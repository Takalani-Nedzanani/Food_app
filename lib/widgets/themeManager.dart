import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeData _themeData;

  ThemeManager(this._themeData);

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
