import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googlebooks/bloc/authbloc.dart';
import 'package:googlebooks/services/navigate.dart';
import 'package:googlebooks/ui/auth/login.dart';
import 'package:googlebooks/ui/views/home.dart';
import 'package:googlebooks/ui/views/navpage.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  BuildContext cu;
  Authbloc authbloc;
  @override
  Widget build(BuildContext context) {
    authbloc = Provider.of<Authbloc>(context);
    cu=context;
    return Scaffold(
      body: Center(
        child: Text('Google Books'),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      check();
    });
  }

  void check() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if(event!=null){
        authbloc.Set(event.uid);
        nav(cu, Bnav(),remove: true);
      }else{
        nav(cu, Login(),remove: true);
      }
    });
  }
}
