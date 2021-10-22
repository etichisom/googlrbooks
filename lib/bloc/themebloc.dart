import 'package:flutter/material.dart';

class Themebloc extends ChangeNotifier{

  ThemeData data = ThemeData.light();

  settheme(ThemeData d){
    data=d;
    notifyListeners();
  }

}