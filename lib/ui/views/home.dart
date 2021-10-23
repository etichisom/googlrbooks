import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlebooks/bloc/bookbloc.dart';
import 'package:googlebooks/component/appbar.dart';
import 'package:googlebooks/component/bookcard.dart';
import 'package:googlebooks/component/searchfield.dart';
import 'package:googlebooks/component/text.dart';
import 'package:googlebooks/model/book.dart';
import 'package:googlebooks/services/getbooks.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getb();
  }
  TextEditingController _textEditingController = TextEditingController();
  Bookbloc _bookbloc ;
  @override
  Widget build(BuildContext context) {
    _bookbloc= Provider.of<Bookbloc>(context);
    return Scaffold(
     body: SafeArea(
         child: Padding(
           padding: EdgeInsets.only(top: 20,left: 20,right: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              text('Explore Thousand of books on the go', 25,isbold: true),
               SizedBox(height: 20,),
               searchfield(_textEditingController,'search for books...',_bookbloc),
               SizedBox(height: 20,),
               text('Famous Books', 20,isbold: true),
               SizedBox(height: 20,),
               _bookbloc.books==null?CupertinoActivityIndicator():
               Expanded(
                 child: Container(
                   child: ListView.builder(
                     itemCount: _bookbloc.books.items.length,
                       shrinkWrap: true,
                       physics: BouncingScrollPhysics(),
                       itemBuilder: (context,index){
                       var data =_bookbloc.books.items[index];
                        return bookcard(data,index,context);
                       }),
                 ),
               )
       ],
     ),
         )),
    );
  }

  void getb() {
    Future.delayed(Duration(seconds:1),(){
      _bookbloc.getbooks('avater');
    });
  }


}
