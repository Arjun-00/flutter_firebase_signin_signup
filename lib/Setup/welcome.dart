import 'package:firebase_login/Setup/signin.dart';
import 'package:firebase_login/Setup/signup.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome PAGE"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(onPressed:navigateSignin,
            child: Text("Sign IN"),
          ),

          RaisedButton(onPressed:navigateSignup,
            child: Text("Sign UP"),
          ),
        ],
      ),
    );
  }
  void navigateSignin(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage(),fullscreenDialog: true));
  }
  void navigateSignup(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUp(),fullscreenDialog: true));
  }
}
