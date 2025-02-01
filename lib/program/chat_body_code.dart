import 'package:flutter/material.dart';

class ChatBodyCode with ChangeNotifier {
  List<Widget> users = [];

  void addUser(Widget user) {
    users.add(user);
    notifyListeners();
  }

  void removeUser(int index) {
    users.removeAt(index);
    notifyListeners();
  }
}