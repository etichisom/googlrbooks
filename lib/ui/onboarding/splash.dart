import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlebooks/animation/slideinanimation.dart';
import 'package:googlebooks/bloc/authbloc.dart';
import 'package:googlebooks/component/text.dart';
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
      backgroundColor: Colors.green,
      body: Center(
        child: Slidein(child: text('Bookie',35,color: Colors.white,isbold: true),duration: 1500,),
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
        Navigator.pushReplacement(cu, CupertinoPageRoute(
            builder:(context)=>Bnav()));
      }else{
        Navigator.pushReplacement(cu, CupertinoPageRoute(
            builder:(context)=>Login()));
      }
    });
  }
}
