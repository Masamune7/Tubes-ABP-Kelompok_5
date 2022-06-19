import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testing/screens/Auth/Login.dart';

class Account extends StatefulWidget {
  var data;
  Account({required this.data});
  @override
  _Account createState() => _Account();
}

class _Account extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 243, 33, 138),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: Container(
        width: 300,
        height: 300,
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  Text(
                    "User Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(),
              Text('Name: ' + widget.data[0]['name']),
              Text('Username: ' + widget.data[0]['username']),
              Text('Email: ' + widget.data[0]['email'] + '\n'),
              Text('Account created at: '),
              Text(widget.data[0]['created_at']),
            ],
          ),
        ),
      )),
    );
  }
}
