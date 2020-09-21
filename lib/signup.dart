import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email;
  String password;

  Future <void> signUp() async {
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      try{
        await Firebase.initializeApp();
        FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password); 
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
      }
      catch(e){
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Sign-Up",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      drawer: new Drawer(),
      body: new Container(
        padding: const EdgeInsets.all(20),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Form(
              key: formKey,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new TextFormField(
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder : OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.blue[600],width: 2),                  
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.blue[600],width: 2),                  
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      prefixIcon: new Icon(Icons.mail,size: 25,color: Colors.blue[300],),
                      hintText: "Enter E-Mail ID",
                      hintStyle: TextStyle(fontSize: 20,color: Colors.blue[300],fontWeight: FontWeight.bold),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value)=>value.contains("@") ? null : "Invalid E-Mail ID",
                    onSaved: (value)=>email=value,
                  ),
                  new Padding(padding: const EdgeInsets.only(top : 10)),
                  new TextFormField(
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder : OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.blue[600],width: 2),                  
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.blue[600],width: 2),                  
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      prefixIcon: new Icon(Icons.vpn_key,size: 25,color: Colors.blue[300],),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(fontSize: 20,color: Colors.blue[300],fontWeight: FontWeight.bold),
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (val)=>val.length<4 ? "Password Too Short" : null ,
                    onSaved: (val)=>password=val,
                  ),
                  new Padding(padding: const EdgeInsets.only(top : 20)),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        new Padding(padding: const EdgeInsets.only(top : 5)),
                        new RaisedButton(
                        elevation: 10,
                        padding: const EdgeInsets.all(5),
                        child: new Text("Sign-Up",style: TextStyle(fontSize: 20,color: Colors.blue[600],fontWeight: FontWeight.bold),),
                        color: Colors.white,
                        shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        onPressed: signUp,
                      )
                    ],
                  )
                ],
              ) 
            ),
          ],
        ),
      ),
    );
  }
}