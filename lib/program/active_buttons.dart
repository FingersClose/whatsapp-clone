import 'package:flutter/material.dart';

class ActiveButtonsCode with ChangeNotifier {
  int _buttonNumber = 1;
  int get number => _buttonNumber;

  void changeButtonNumber(int number) {
    if (_buttonNumber != number) {
      _buttonNumber = number;
      notifyListeners();
    }
  }
}