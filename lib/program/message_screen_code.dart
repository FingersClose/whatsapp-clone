import 'package:flutter/material.dart';

class MessageScreenCode with ChangeNotifier {
  String? _username;
  String? _subtitle;
  String? phoneNumber;

  Widget? screen;

  String get subtitle => _subtitle ?? "null";

  String get username => _username ?? "null";
  
  void subtitleSet(String? subtitle) {
    _subtitle = subtitle;
    notifyListeners();
  }

  void addScreen(Widget sc) {
    screen = sc;
    notifyListeners();
  }

  void changeUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void removeUsername() {
    _username = "";
    notifyListeners();
  }

  void replaceUsernameToPhoneNumber(String? phone) {
    _username = phone ?? phoneNumber;
    notifyListeners();
  }

  void resetUsernameFromPhone(String username) {
    _username = username;
    notifyListeners();
  }
}