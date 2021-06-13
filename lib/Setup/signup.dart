import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/Pages/home.dart';
import 'package:firebase_login/Setup/signin.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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

            RaisedButton(onPressed:signup,
              child: Text("SignUP"),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> signup() async {
    final formState = _formkey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)) as FirebaseUser;
        user.sendEmailVerification();
       // Navigator.of(context).pop();
      }
      catch(e){
        print(e.message);

      }
      Navigator.of(context).pop();
    }
  }
}
