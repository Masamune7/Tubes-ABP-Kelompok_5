import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => Home(),
      '/Second': (context) => Second(),
    },
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("First Route"),
          centerTitle: true,
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Second');
                },
                child: Text("Open route")
            )
        )
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
          centerTitle: true,
        ),
        body: Center(
              child: ElevatedButton(
                child: Text("Go back!"),
                onPressed: () => Navigator.pop(context),
              ),
        )
    );
  }
}
