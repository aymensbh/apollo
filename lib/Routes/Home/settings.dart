import 'package:apollo/Utils/firebasehelper.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: RaisedButton(
          child: Text("disconnect"),
          onPressed: (){
            firebaseAuth.signOut();
          },
        ),
      ),
    );
  }
}