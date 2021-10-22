import 'package:flutter/material.dart';
import 'package:googlebooks/bloc/authbloc.dart';
import 'package:googlebooks/component/appbar.dart';
import 'package:googlebooks/component/button.dart';
import 'package:googlebooks/component/text.dart';
import 'package:googlebooks/component/textfeild.dart';
import 'package:googlebooks/services/authservices.dart';
import 'package:googlebooks/services/navigate.dart';
import 'package:googlebooks/ui/auth/resister.dart';
import 'package:googlebooks/ui/views/home.dart';
import 'package:googlebooks/ui/views/navpage.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Authbloc authbloc = Provider.of<Authbloc>(context);
    return Scaffold(
      appBar: appbar(context, 'Login'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            text('Login with email and password', 11),
            SizedBox(height: 5,),
            field(email, 'Email'),
            SizedBox(height: 20,),
            field(password, 'Password'),
            SizedBox(height: 50,),
            button((){
              signin(context,authbloc);
            }, 'Login'),
            GestureDetector(
              onTap: (){
               nav(context, Register());
              },
                child: text('Already have an account? Sign up', 14)),
          ],
        ),
      ),
    );
  }

  void signin(BuildContext context,Authbloc authbloc) {
    Authservice().emaillogin(email.text.trim(), password.text.trim()).
    then((value){
      if(value != null){
        authbloc.Set(value.user.uid);
        nav(context, Bnav(),remove: true);
      }
    });
  }
}
