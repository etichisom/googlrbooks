
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlebooks/bloc/bookbloc.dart';

Widget searchfield(TextEditingController textEditingController,String hint,Bookbloc bookbloc) {
  return PhysicalModel(
    color: Colors.black,
    elevation: 5,
    borderRadius: BorderRadius.circular(20),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onSubmitted: (e){
          bookbloc.getbooks(e);
        },
        onChanged: (e){
          bookbloc.getbooks(e);
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search,),
            contentPadding: EdgeInsets.all(20),
            hintText: hint

        ),
      ),
    ),
  );
}