// ignore: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Post.dart';

class EditPost extends StatefulWidget {
  final Map post;
  final Map auth;
  EditPost({required this.post, required this.auth});
  @override
  _EditPost createState() => _EditPost();
}

class _EditPost extends State<EditPost> {
  final _formKey = GlobalKey<FormState>();
  double sliderKepuasan = 3;
  double sliderKebersihan = 3;
  TextEditingController reviewController = TextEditingController();

  Future updatePost() async {
    String kepuasan = sliderKepuasan.toInt().toString();
    String kebersihan = sliderKebersihan.toInt().toString();

    Map data = {
      "user_id": "${widget.auth['id']}",
      "kepuasan": "${kepuasan}",
      "kebersihan": "${kebersihan}",
      "pesan": reviewController.text
    };

    final response = await http.put(
        Uri.parse(
            "http://10.0.2.2:8000/api/review/" + widget.post['id'].toString()),
        body: data);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 33, 138),
        title: Text("Edit Post"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
            width: 350,
            height: 400,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Isi form
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(" User Review:")),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Masukkan review anda",
                          labelText: "Review",
                          icon: Icon(Icons.comment),
                          border: OutlineInputBorder()),
                      controller: reviewController..text = widget.post['pesan'],
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please input a review";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Kepuasan:")),
                    Slider(
                        activeColor: Color.fromARGB(255, 243, 33, 138),
                        min: 1,
                        max: 5,
                        divisions: 4,
                        value: sliderKepuasan,
                        label: '${sliderKepuasan.round()}',
                        onChanged: (value) {
                          setState(() => sliderKepuasan = value);
                        }),
                    const SizedBox(height: 10),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Kebersihan:")),
                    Slider(
                        activeColor: Color.fromARGB(255, 243, 33, 138),
                        min: 1,
                        max: 5,
                        divisions: 4,
                        value: sliderKebersihan,
                        label: '${sliderKebersihan.round()}',
                        onChanged: (value) {
                          setState(() => sliderKebersihan = value);
                        }),
                    RaisedButton(
                        child: const Icon(Icons.send),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            updatePost().then((value) {
                              //snackbar
                              const snackBar = SnackBar(
                                content: Text("Review has been updated"),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          } else {}
                        })
                  ],
                ))),
      ),
    );
  }
}
