import 'package:firebase_login/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return "plese type an email";
                }
              },
              onSaved:(input) => _email=input ,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),

            TextFormField(
              validator: (input){
                if(input.length < 6){
                  return "password need atleast 6 character";
                }
              },
              onSaved:(input) => _password=input ,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),

            RaisedButton(onPressed:signin,
            child: Text("SignIn"),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> signin() async {
    final formState = _formkey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      }
      catch(e){
        print(e.message);

      }
    }
  }
}
