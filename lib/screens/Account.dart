import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Account extends StatefulWidget {
  @override
  _Account createState() => _Account();
}
class _Account extends State<Account>{
  String url = 'http://10.0.2.2:8000/api/user/test/password';
  Future getUser() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user, Error: ${response.statusCode}');
    }
  }
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
                  
                },
                icon: Icon(Icons.menu))
          ],
      ),
      body: FutureBuilder<dynamic>(
      future: getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text(snapshot.data['user']['username']),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: const CircularProgressIndicator());
      }
      )
    );
  }
}
