import 'package:flutter/material.dart';

Widget field(TextEditingController controller,String s){
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: s
    ),
  );
}