import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlebooks/component/text.dart';

Widget button(Function ontap,String title){
  return  RaisedButton(
    onPressed:ontap,
    color: Colors.green,
    child:text(title, 15,color: Colors.white),
  );
}