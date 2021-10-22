import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:googlebooks/util/toast.dart';

class Bookservices {
 var store = FirebaseFirestore.instance;
  savebook(String uid,Map<String,dynamic> map,String bookid){
    print(uid);
    try{
      store.collection('books').doc(uid).collection('savedbooks')
          .doc(bookid).set(map).then((value){
       toast('Book Saved');
      });
    }catch(e){
      toast(e.toString());
    }

  }
  Removebook(String uid ,String bookid){
    try{
      store.collection('books').doc(uid).collection('savedbooks')
          .doc(bookid).delete().then((value){
        toast('book Removed');
      });
    }catch(e){
      toast(e.toString());
    }
  }
}