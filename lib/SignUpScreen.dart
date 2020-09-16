import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'HomeScreen.dart';
import 'LogInScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = "", password = "";
  var _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> register() async {
    // ignore: unused_local_variable
    User user = (await auth.createUserWithEmailAndPassword(
        email: email.trim(), password: password)) as User;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 180,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      "Welcome to our Sevenesound",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(150)),
                color: Colors.blue,
              ),
            ),
            Theme(
              data: ThemeData(hintColor: Colors.blue),
              child: Padding(
                padding: EdgeInsets.only(top: 50, right: 20, left: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter User Name!";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'UserName',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                  ),
                ),
              ),
            ),
            Theme(
              data: ThemeData(hintColor: Colors.blue),
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter Email!";
                    } else {
                      email = value;
                    }

                    return null;
                  },
                  /* onSaved: (value) {
                    email = value;
                  },*/
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                  ),
                ),
              ),
            ),
            Theme(
              data: ThemeData(hintColor: Colors.blue),
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                child: TextFormField(
                  obscureText: true,
                  autocorrect: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter Password!";
                    } else if (value.length < 8) {
                      return "Vlaue Password shouldn't less than 8 character!";
                    } else {
                      password = value;
                    }

                    return null;
                  },
                  /*onSaved: (value) {
                    password = value;
                  },*/
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      register();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomeScreen()));
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blue,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  padding: EdgeInsets.all(10),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.blue,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: RaisedButton(
                onPressed: () {},
                color: Colors.blue,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.google,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Sign Up with google",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
                child: Column(
              children: <Widget>[
                Text(
                  "You already have an account ?",
                  style: TextStyle(color: Colors.blue),
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => LogInScreen()));
                    },
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Log In",
                          style: TextStyle(color: Colors.blue),
                        ),
                        Container(
                          width: 45,
                          height: 1,
                          color: Colors.blue,
                        ),
                      ],
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
