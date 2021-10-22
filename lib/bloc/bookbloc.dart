import 'package:flutter/cupertino.dart';
import 'package:googlebooks/model/book.dart';
import 'package:googlebooks/services/getbooks.dart';

class Bookbloc extends ChangeNotifier{
  Books books;


  getbooks(String query,)async{
   books = await Getbooks().getbook(query);
   notifyListeners();
  }
}