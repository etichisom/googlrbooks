import 'package:flutter/material.dart';
import 'package:googlebooks/bloc/authbloc.dart';
import 'package:googlebooks/component/appbar.dart';
import 'package:googlebooks/component/button.dart';
import 'package:googlebooks/component/text.dart';
import 'package:googlebooks/component/textfeild.dart';
import 'package:googlebooks/services/authservices.dart';
import 'package:googlebooks/services/navigate.dart';
import 'package:googlebooks/ui/views/home.dart';
import 'package:googlebooks/ui/views/navpage.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool apicall = false;
  stop(){setState(() {apicall=false;});}
  start(){setState(() {apicall=true;});}
  @override
  Widget build(BuildContext context) {
    Authbloc authbloc = Provider.of<Authbloc>(context);
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar:appbar(context, 'Sign up') ,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              text('Sign up with email and password', 11),
              SizedBox(height: 5,),
              field(email, 'Email'),
              SizedBox(height: 20,),
              field(password, 'Password',secure: true),
              SizedBox(height: 50,),
              apicall?Loadbutton():button((){signin(context, authbloc);}, 'Sign up'),

            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }
  void signin(BuildContext context,Authbloc authbloc) {
    start();
    Authservice().emailsignup(email.text.trim(), password.text.trim()).
    then((value){
      stop();
      if(value != null){
        authbloc.Set(value.user.uid).then((value){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Bnav()));
        });

      }
    }).catchError((e){stop();});
  }
}
