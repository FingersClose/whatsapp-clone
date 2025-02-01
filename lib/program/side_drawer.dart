import 'package:flutter/material.dart';

class SideDrawerCode with ChangeNotifier {
  String currentScreen = "home";
  void changeToStatus() {
    if (currentScreen != "status") {
      currentScreen = "status";
      notifyListeners();
    }
  }

  void changeToHome() {
    if (currentScreen != "home") {
      currentScreen = "home";
      notifyListeners();
    }
  }

  void changeToCommunities() {
    if (currentScreen != "communities") {
      currentScreen = "communities";
      notifyListeners();
    }
  }

  void changeToChannel() {
    if (currentScreen != "channel") {
      currentScreen = "channel";
      notifyListeners();
    }
  }

  void changeToProfile() {
    if(currentScreen != "profile") {
      currentScreen = "profile";
      notifyListeners();
    }
  }

  void changeToSettings() {
    if(currentScreen != "settings") {
      currentScreen = "settings";
      notifyListeners();
    }
  }
}
