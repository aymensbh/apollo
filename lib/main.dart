import 'package:apollo/Utils/firebasehelper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'Routes/homePage.dart';
import 'Routes/welcome.dart';

void main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(MaterialApp(
    title: "Apollo",
    theme: ThemeData(
      canvasColor: Colors.transparent,
    ),
    home: Router(),
  ));
}

class Router extends StatefulWidget {
  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: firebaseAuth.onAuthStateChanged,
      builder: (context, snapshot) {
        return AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: snapshot.hasData ? initUser(snapshot.data) : WelcomePage());
      },
    );
  }

  Widget initUser(FirebaseUser fbuser) {
    firebaseUser = fbuser;
    user = Firestore.instance.collection("user").document(firebaseUser.uid);
    return HomePage();
  }
}
