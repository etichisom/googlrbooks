import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:googlebooks/bloc/authbloc.dart';
import 'package:googlebooks/component/appbar.dart';
import 'package:googlebooks/services/bookservice.dart';
import 'package:googlebooks/services/navigate.dart';
import 'package:googlebooks/ui/views/bookdetails.dart';
import 'package:provider/provider.dart';

class Saved extends StatefulWidget {

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  var store = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var authbloc = Provider.of<Authbloc>(context);
    return Scaffold(
      appBar: appbar(context, 'Saved Books'),
      body: StreamBuilder<QuerySnapshot>(
        stream:store.collection('books').doc(authbloc.Uid).collection('savedbooks').snapshots() ,
        builder: (context, snapshot) {
          if(snapshot.data!=null){
            var data = snapshot.data.docs;
          return ListView.builder(
            itemCount: data.length,
              itemBuilder:(context,index){
                var value= snapshot.data.docs[index];
               return ListTile(
                 trailing: GestureDetector(
                   onTap: (){
                     Bookservices().Removebook(authbloc.Uid, value['bookid']);
                   },
                     child: Icon(Icons.remove_circle_rounded,color: Colors.red,)),
                 onTap: (){
                   move(value,context,index);
                 },
                 title:Text(value['title']) ,
                 subtitle:Text(value['publisher']),
                 leading: Image.network(value['image']),
               );
              }
          );
          }
          return Center(child: CircularProgressIndicator());
        }
      ),
    );
  }

  void move(QueryDocumentSnapshot value, BuildContext context,int index) {
    nav(context, Bookdetails(desc:value['desc'].toString(),
        publisher: value['publisher'].toString(),
        title:value['title'], image:value['image'],
        bookid: value['bookid'], index: index,
        booklink:value['link']));
  }
}
