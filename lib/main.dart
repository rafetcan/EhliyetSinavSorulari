import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizmaker/helper/functions.dart';
import 'package:quizmaker/views/addquestion.dart';
import 'package:quizmaker/views/home.dart';
import 'package:quizmaker/views/signin.dart';
import 'package:connectivity/connectivity.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Ehliyet Sınav Soruları',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: (_isLoggedin ?? false) ? Home() : SignIn(),
      // home: AddQuestion("001XQcrq2tIV5XUXGXN34Zb"),
      home: MyApp(),
    ),
  );
}

bool _connectStatus = false;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedin = false;

  @override
  void initState() {
    // connectCheck();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Home())));
    checkUserLoggedInStatus();
    super.initState();
  }

  checkUserLoggedInStatus() async {
    HelperFunctions.getUserLoggedInDetails().then((value) {
      setState(() {
        _isLoggedin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Merhaaba Burada Splash Screen Olacak.'),
        ),
      ),
    );
  }
}
