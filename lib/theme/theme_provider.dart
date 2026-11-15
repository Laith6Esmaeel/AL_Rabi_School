
import 'package:flutter/material.dart';

class themeProvider extends ChangeNotifier {
  bool _themeData = true;
  bool get themeData => _themeData;

  set themeData(bool value) {
    _themeData = value;
  }

  changemode() {
    if (_themeData == true) {
      _themeData = false;
      notifyListeners();
    } else if (_themeData == false) {
      _themeData == true;
      notifyListeners();
    }
  }
}
