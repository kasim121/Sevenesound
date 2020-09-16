import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LogInScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> logOut() async {
    // ignore: unused_local_variable
    User user = auth.signOut() as User;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                logOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LogInScreen()));
              },
              icon: Icon(Icons.person),
              label: Text("Log out"))
        ],
      ),
    );
  }
}
