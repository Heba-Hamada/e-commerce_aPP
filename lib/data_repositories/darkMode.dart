import 'package:flutter/cupertino.dart';

class Themeser extends ChangeNotifier {
  bool _darkTheme = true;
  bool get darkTheme => _darkTheme;
  set darkTheme(bool value) {
    _darkTheme = value;
    notifyListeners();
  }
}
