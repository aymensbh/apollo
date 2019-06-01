import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'Home/home.dart';
import 'Home/search.dart';
import 'Home/settings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;
  @override
  void initState() {
    _controller = new PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi"),
      ),
      body: Container(
        color: Colors.white,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: <Widget>[
            Home(),
            Search(),
            Settings(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 12,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(LineIcons.home),
              onPressed: () {
                _controller.animateToPage(0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: Icon(LineIcons.search),
              onPressed: () {
                _controller.animateToPage(1,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: Icon(LineIcons.gear),
              onPressed: () {
                _controller.animateToPage(2,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
          ],
        ),
      ),
    );
  }
}
