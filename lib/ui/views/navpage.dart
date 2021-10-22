import 'package:flutter/material.dart';
import 'package:googlebooks/component/appbar.dart';
import 'package:googlebooks/ui/views/home.dart';
import 'package:googlebooks/ui/views/savedbooks.dart';
import 'package:googlebooks/ui/views/settings.dart';

class Bnav extends StatefulWidget {


  @override
  _BnavState createState() => _BnavState();
}

class _BnavState extends State<Bnav> {

  int index = 0;
  @override
  Widget build(BuildContext context) {
    List w = [Home(),Saved(),Setting()];
    return Scaffold(
      body:w[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (e){
          setState(() {
            index=e;
          });
        },
        items: [
         BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home', ),
          BottomNavigationBarItem(icon: Icon(Icons.save),label:'saved', ),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label:'Settings',)
        ],
      ),
    );
  }
}
