import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LogInScreen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  String currentEmail;
  HomeScreen(this.currentEmail);
  @override
  _HomeScreenState createState() => _HomeScreenState(currentEmail);
}

class _HomeScreenState extends State<HomeScreen> {
  String currentEmail;
  _HomeScreenState(this.currentEmail);

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> logOut() async {
    // ignore: unused_local_variable
    auth.signOut().then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => LogInScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                logOut();
              },
              icon: Icon(Icons.person),
              label: Text("Log out"))
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.cyan,
              height: 170,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Image(
                      image: AssetImage("images/circle.png"),
                      height: 90,
                      width: 90),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    currentEmail,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("Buy Song Now!"),
              leading: Icon(Icons.file_download),
            ),
            ListTile(
              title: Text("Share & Earn!"),
              leading: Icon(Icons.share),
            ),
            ListTile(
              title: Text("Song in Progress"),
              leading: Icon(Icons.arrow_downward),
            ),
            ListTile(
              title: Text("Add Person!"),
              leading: Icon(Icons.person_add),
            ),
          ],
        ),
      ),
    );
  }
}
