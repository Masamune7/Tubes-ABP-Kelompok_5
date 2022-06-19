import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => Home(),
      '/Todos': (context) => Todos(),
    },
  ));
}

class Home extends StatelessWidget {
  final List page = [
    "Todo 0",
    "Todo 1",
    "Todo 2",
    "Todo 3",
    "Todo 4",
    "Todo 5",
    "Todo 6",
    "Todo 7",
    "Todo 8"
  ];

  String current = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      current = page[index];
                      Navigator.pushNamed(context, '/Todos',
                          arguments: {'current': current});
                    },
                    child:
                        Text(page[index], style: const TextStyle(fontSize: 20, color: Colors.black87))
                )
              ],
            ),
          );
        },
        itemCount: page.length,
      ),
    );
  }
}

class Todos extends StatelessWidget {
  @override
  var args;
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    if (arguments != null) {
      args = arguments['current'];
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(args),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Text("A description of what needs to be done for $args"),
                ],
            )
          )
        )
    );
  }
}
