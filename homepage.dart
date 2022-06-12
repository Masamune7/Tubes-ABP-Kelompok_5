import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page Orchid'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 260,
            width: 600,
            child: Image.asset(
              'assets/asset3.jpg',
            ),
          ),
          Container(
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/asset-logo.jpg',
                      height: 80,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Text(
                  'Wisata Orchid',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
