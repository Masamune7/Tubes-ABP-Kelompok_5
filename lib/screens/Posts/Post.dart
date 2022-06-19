import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing/screens/Posts/CreatePost.dart';
import 'package:testing/screens/Posts/EditPost.dart';

class Post extends StatefulWidget {
  var authData;
  Post({required this.authData});
  @override
  _Post createState() => _Post();
}

class _Post extends State<Post> {
  final _formKey = GlobalKey<FormState>();
  final String url = 'http://10.0.2.2:8000/api/review';
  double sliderValue = 0;
  var posts;
  var users;
  var data = [];

  Future getReviews() async {
    String userUrl = 'http://10.0.2.2:8000/api/user';
    var postResponse = await http.get(Uri.parse(url));
    var userResponse = await http.get(Uri.parse(userUrl));
    if (postResponse.statusCode == 200) {
      data = [];
      posts = json.decode(postResponse.body)['data'];
      users = json.decode(userResponse.body)['user'];
      data.add(posts);
      data.add(users);
      // return json.decode(postResponse.body);
      return data;
    } else {
      throw Exception(
          'Failed to load posts, Error: ${postResponse.statusCode}');
    }
  }

  Future deletePost(String postid) async {
    String url = 'http://10.0.2.2:8000/api/review/' + postid;

    var response = await http.delete(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Reviews"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 243, 33, 138),
        ),
        body: FutureBuilder<dynamic>(
            future: getReviews(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // List view
                return ListView.builder(
                    itemCount: snapshot.data[0].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: (index % 2 == 0)
                              ? Colors.blueGrey[100]
                              : Colors.blueGrey[200],
                        ),
                        child: Card(
                          elevation: 5,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                //Content Images
                                Container(
                                    width: 50.0,
                                    height: 50.0,
                                    margin: const EdgeInsets.all(5.0),
                                    child: (index % 2 == 0)
                                        ? const Icon(
                                            Icons.comment_outlined,
                                            size: 45.0,
                                          )
                                        : const Icon(
                                            Icons.comment,
                                            size: 45.0,
                                          )),
                                //Content Text
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i < snapshot.data[1].length;
                                        i++)
                                      if (snapshot.data[0][index]['user_id'] ==
                                          snapshot.data[1][i]['id'])
                                        Container(
                                            padding: EdgeInsets.only(
                                                right: 5, bottom: 5),
                                            child: Text(
                                              "Name: " +
                                                  snapshot.data[1][i]
                                                      ['username'],
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                    Row(
                                      children: [
                                        Text(
                                            "Kepuasan: " +
                                                snapshot.data[0][index]
                                                    ['kepuasan'],
                                            style: const TextStyle(
                                                color: Colors.grey)),
                                        Text(
                                            " | Kebersihan: " +
                                                snapshot.data[0][index]
                                                    ['kebersihan'],
                                            style: const TextStyle(
                                                color: Colors.grey))
                                      ],
                                    ),
                                    Expanded(
                                        child: Container(
                                            width: 200,
                                            child: Text(
                                              snapshot.data[0][index]['pesan'],
                                              overflow: TextOverflow.fade,
                                            ))),
                                  ],
                                ),
                                //Content Buttons
                                if(snapshot.data[0][index]['user_id'] ==
                                            widget.authData[0]['id'])
                                Row(children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditPost(
                                                              post: snapshot
                                                                      .data[0][
                                                                  index], auth: widget.authData[0],))).then(
                                                  (_) => setState(() {}));
                                            },
                                        icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        deletePost(snapshot.data[0][index]['id']
                                                .toString())
                                            .then((value) {
                                          const snackBar = SnackBar(
                                            content:
                                                Text("Post has been deleted"),
                                          );
                                          setState(() {});
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        });
                                      },
                                      icon: const Icon(Icons.delete)),
                                ]),
                                if(snapshot.data[0][index]['user_id'] !=
                                            widget.authData[0]['id'])
                                SizedBox(),
                              ]),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: const CircularProgressIndicator());
            }),
        // Add button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreatePost(auth: widget.authData[0])))
                .then((_) => setState(() {}));
          },
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 243, 33, 138),
          child: const Icon(Icons.add),
        ));
  }
}
