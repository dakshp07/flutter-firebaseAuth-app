import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebaseAuth_app/main.dart';

class WelcomeScreen extends StatefulWidget {

  final User userId;
  WelcomeScreen({this.userId});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  Future<void> signOut() async{
    await Firebase.initializeApp();
    FirebaseAuth.instance.signOut();
    Navigator.push(context, (MaterialPageRoute(builder: (BuildContext context)=>HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new Column(
        children: [
      new Center(
        child: new Text("Sucessfully Signed In : "+(widget.userId.email),style: TextStyle(fontSize: 25,color: Colors.black),),
      ),
      new RaisedButton(
        child: new Text("Sign-Out"),
        onPressed: signOut,
        )
        ],
      )
    );
  }
}