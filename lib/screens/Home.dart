import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 33, 138),
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
