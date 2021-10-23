import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googlebooks/bloc/bookbloc.dart';
import 'package:googlebooks/bloc/themebloc.dart';
import 'package:googlebooks/ui/auth/login.dart';
import 'package:googlebooks/ui/auth/resister.dart';
import 'package:googlebooks/ui/onboarding/splash.dart';
import 'package:googlebooks/ui/views/home.dart';
import 'package:provider/provider.dart';

import 'bloc/authbloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Bookbloc()),
        ChangeNotifierProvider(create: (_) => Authbloc()),
        ChangeNotifierProvider(create: (_) => Themebloc())
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google books',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

