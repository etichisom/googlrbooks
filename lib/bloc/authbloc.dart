import 'package:flutter/cupertino.dart';

class Authbloc extends ChangeNotifier{
  String Uid;

  Future<dynamic> Set(String id)async{
    Uid=id;
    notifyListeners();
    return true;
  }
}