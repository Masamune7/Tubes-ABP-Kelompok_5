import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SecondPage extends StatelessWidget {
  final Map data;
  SecondPage({required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jurnal MOD 14_Page 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: EdgeInsets.all(10),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("User ID: ${data['userId']}"),
              Text("ID: ${data['id']}"),
              Text("Title: ${data['title']}", textAlign: TextAlign.center,),
              (data['completed'] == true)? Text("(Completed)"):Text("(Not Completed)")
              ]
            ),
          ),
        )
      ),
    );
  }
}
