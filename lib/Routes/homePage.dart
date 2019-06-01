import 'package:apollo/Utils/firebasehelper.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        title: Row(
          children: <Widget>[
            StreamBuilder(
              stream: user.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CircleAvatar(
                    backgroundColor: Color(0xFF8f7fa0),
                    maxRadius: 100,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  );
                } else {}
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
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
        color: Color(0xFF2c2c2c),
        height: MediaQuery.of(context).size.height / 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(LineIcons.home,color: Colors.white),
              onPressed: () {
                _controller.animateToPage(0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: Icon(LineIcons.search,color: Colors.white),
              onPressed: () {
                _controller.animateToPage(1,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: Icon(LineIcons.gear,color: Colors.white),
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
