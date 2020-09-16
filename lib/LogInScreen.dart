import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seven_e_sound/HomeScreen.dart';
import 'ForgotScreen.dart';
import 'SignUpScreen.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String email = "", password = "";
  var _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<String> logIn() async {
    String user = (await auth.signInWithEmailAndPassword(
            email: email.trim(), password: password))
        .toString();
    return user;
  }

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  // Future<void> GoogleSignIn() async {}

  @override
  void initState() {
    super.initState();
    Future(() async {
      // ignore: await_only_futures
      if (await auth.currentUser != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext conext) => HomeScreen()));
      }
    });
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
                      "Log In",
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
                    } else {
                      password = value;
                    }
                    return null;
                  },
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
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext cntext) => ForgotScreen()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blue),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Future<String> check = logIn();
                      if (check != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HomeScreen()));
                      }
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blue,
                  child: Text(
                    "Log In",
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
                      "Sign in with google",
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
                  "Don't have an account ?",
                  style: TextStyle(color: Colors.blue),
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => SignUpScreen()));
                    },
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Sign Up",
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
