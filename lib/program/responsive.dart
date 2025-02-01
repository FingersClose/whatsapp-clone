import 'package:flutter/material.dart';

class Responsive with ChangeNotifier {
  double currentScreenSize = 0;

  bool isMobile = false;

  void setScreenSize(double size) {
    currentScreenSize = size;
    if(size >= 600) {
      if(isMobile){
        isMobile = false;
        notifyListeners();
      }
      
    } else {
      if(!isMobile){
        isMobile = true;
        notifyListeners();
      }
    }
    print(size);
  }

}