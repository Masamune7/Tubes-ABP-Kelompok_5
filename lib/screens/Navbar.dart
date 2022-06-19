import 'package:flutter/material.dart';
import 'Posts/Post.dart';
import 'Home.dart';
import 'Account.dart';

class Navbar extends StatefulWidget {
  @override
  _Navbar createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Home(),
          Post(),
          Account()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 243, 33, 138),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Reviews'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Profile'),
        ],
      ),
    );
  }
}
