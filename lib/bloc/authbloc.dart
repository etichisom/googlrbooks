import 'package:flutter/cupertino.dart';

class Authbloc extends ChangeNotifier{
  String Uid;

  Set(String id){
    Uid=id;
    notifyListeners();
  }
}