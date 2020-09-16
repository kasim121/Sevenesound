import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  String email;
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Forgotten Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  "We will mail you to link.. please click on that link to reset your password!",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
                Theme(
                  data: ThemeData(hintColor: Colors.blue),
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Email!";
                        } else {
                          email = value;
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email)
                              .then((value) => print("check your mails!"));
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.blue,
                      child: Text(
                        "Send Email",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      padding: EdgeInsets.all(10),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
