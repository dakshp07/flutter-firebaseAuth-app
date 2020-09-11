import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {

  final User userId;
  WelcomeScreen({this.userId});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new Center(
        child: new Text("Sucessfully Signed In : "+(widget.userId.email),style: TextStyle(fontSize: 25,color: Colors.black),),
      ),
    );
  }
}