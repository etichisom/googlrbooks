import 'package:flutter/material.dart';
import 'package:googlebooks/bloc/authbloc.dart';
import 'package:googlebooks/component/appbar.dart';
import 'package:googlebooks/component/text.dart';
import 'package:googlebooks/model/book.dart';
import 'package:googlebooks/services/bookservice.dart';
import 'package:provider/provider.dart';

class Bookdetails extends StatefulWidget {
  int index;
  String title;
  String publisher;
  String bookid;
  String desc;
  String image;
  String booklink;
  Bookdetails({@required this.desc,@required this.publisher,@required this.title,
    @required this.image,@required this.bookid,@required this.index,@required this.booklink
   });

  @override
  _BookdetailsState createState() => _BookdetailsState();
}

class _BookdetailsState extends State<Bookdetails> {
  @override
  Widget build(BuildContext context) {
    Authbloc authbloc = Provider.of<Authbloc>(context);
    return Scaffold(
     appBar:AppBar(
       elevation: 0,
       iconTheme: IconThemeData(color:Colors.black),
       backgroundColor: Colors.transparent,
      actions: [
        Icon(Icons.save),
        SizedBox(width: 10,),
     ],
     ),
      body:Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                Hero(
                  tag: 'bb',
                    child: Image.network(widget.image)),
                SizedBox(height: 20,),
                text(widget.title.toString(), 20,isbold: true),
                SizedBox(height: 5,),
                text(widget.publisher.toString(), 15,),
                SizedBox(height: 30,),
               widget.desc==null?text('No description', 16):text(widget.desc.toString(), 20,color: Colors.grey[700]),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(onPressed: (){

                    }, color: Colors.blue,
                        child:text('Book link', 15,color: Colors.white)),
                    SizedBox(width: 20,),
                    OutlineButton(onPressed: (){
                     save(authbloc);
                    },child: text('Save', 15,),)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void save(Authbloc authbloc) {
    Bookservices().savebook(authbloc.Uid, {
      'title':widget.title,
      'publisher':widget.publisher,
      'desc':widget.desc,
      'bookid':widget.bookid,
      'image':widget.image,
      'link':widget.booklink,
    }, widget.bookid);
  }
}
