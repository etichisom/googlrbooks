

import 'dart:convert';

import 'package:googlebooks/model/book.dart';
import 'package:http/http.dart' as http;

class Getbooks {


  Future<Books>getbook(String query,{int maxnumber = 10})async{
    final uri = Uri.parse('https://www.googleapis.com/books/v1/volumes?q='+query.toString()+'&maxResults='+maxnumber.toString());
    print('spendinfd da cahs');
    try{
     http.Response response = await http.get(uri);
     var mapresponse = jsonDecode(response.body);
     if(response.statusCode==200){
      Books book = Books.fromJson(mapresponse);
      print(book);
       return book;
     }else{
       return null;
     }

    }catch(e){
      print(e);
    }
  }
}