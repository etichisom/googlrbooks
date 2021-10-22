import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Authservice{
  var auth = FirebaseAuth.instance;
  Future<UserCredential> emailsignup(String email ,String password)async{
    try{
      var authuser = await  auth.createUserWithEmailAndPassword(email: email, password: password);
      return authuser;
    }catch(e){
     print(e);
    }

  }
  Future<UserCredential> emaillogin(String email ,String password)async{
    try{
      var authuser = await  auth.signInWithEmailAndPassword(email: email, password: password);
      return authuser;
    }catch(e){
      print(e);
    }

  }
}