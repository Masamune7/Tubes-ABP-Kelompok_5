import 'package:flutter/material.dart';
import 'package:testing/screens/Navbar.dart';
import 'Register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  static TextEditingController userNameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  var data = [];

  /// Api Request

  Future login(String username, String password) async {
    String url = 'http://10.0.2.2:8000/api/user/' + username + '/' + password;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      data = [];
      var user = jsonDecode(response.body)['user'];
      data.add(user);
      // return data;
    } else {
      throw Exception('Failed to load user, Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 243, 33, 138),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Login Form',
                        style: TextStyle(fontSize: 18),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your username";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 17),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Log In'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            login(userNameController.text,
                                    passwordController.text)
                                .then((value) {
                              if (data[0] == null) {
                                const snackBar = SnackBar(
                                    content: Text(
                                        'Username / Password is incorrect'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Navbar(data: data)));
                              }
                            });
                            userNameController.text = '';
                            passwordController.text = '';
                          }
                        },
                      )),
                  Row(
                    children: <Widget>[
                      const Text('Do you not have an account?'),
                      TextButton(
                        child: const Text(
                          'Register here.',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
