import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/post_page.dart';
import 'package:flutter_demo/src/pages/senddata_server.dart';

import 'images_page.dart';
import 'users_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  final _pageOptions = [Users(), Posts(), Images(),SendData()];

  var v1 =
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'USERS');

  var v2 = BottomNavigationBarItem(
      icon: Icon(Icons.local_post_office), label: 'POSTS');

  var v3 =
      BottomNavigationBarItem(icon: Icon(Icons.image), label: 'IMAGES');

  var v4 = BottomNavigationBarItem(
      icon: Icon(Icons.comment), label: 'postData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          elevation: 3,
          items: <BottomNavigationBarItem>[v1, v2, v3,v4],
        ));
  }
}
