import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing/Jurnal/Jurnal_14.2.dart';
import 'dart:convert';
import 'Jurnal_14.2.dart';

class Home extends StatelessWidget {
  final String url = "https://jsonplaceholder.typicode.com/todos";

  Future getData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load todos");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Jurnal MOD 14_Page 1'),
          centerTitle: true,
        ),
        body: FutureBuilder<dynamic>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          width: 300,
                          height: 200,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: FlatButton(
                                      child: Text(
                                        snapshot.data[index]['title'],
                                        overflow: TextOverflow.fade,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20, color: Colors.black87),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SecondPage(
                                                        data: snapshot
                                                            .data[index])));
                                      }),
                                ),
                                (snapshot.data[index]['completed'].toString() ==
                                        'true')
                                    ? Text("Completed", style: TextStyle(color: Colors.black54))
                                    : Text("Not Completed", style: TextStyle(color: Colors.black54)),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            }));
  }
}
