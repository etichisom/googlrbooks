import 'package:flutter/cupertino.dart';

nav(BuildContext context,Widget page,{bool remove =false}){
  if(remove==true){
    Navigator.pushReplacement(context, CupertinoPageRoute(
        builder:(context)=>page));
  }else{
    Navigator.push(context, CupertinoPageRoute(
        builder:(context)=>page));
  }

}