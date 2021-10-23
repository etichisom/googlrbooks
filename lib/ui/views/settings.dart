import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlebooks/bloc/themebloc.dart';
import 'package:googlebooks/component/appbar.dart';
import 'package:googlebooks/services/navigate.dart';
import 'package:googlebooks/ui/auth/login.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Themebloc themebloc = Provider.of<Themebloc>(context);
    return Scaffold(
      appBar: appbar(context,'Settings'),
      body: ListView(
        physics:BouncingScrollPhysics(),
        children: [
          ListTile(
            onTap: (){
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(
                    builder: (context) => Login()), (route) => false);
              });
            },
            title: Text('Logout'),
            trailing: Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}
