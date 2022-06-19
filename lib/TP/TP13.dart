import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => Home(),
      '/Tubes1': (context) => Tubes1(),
      '/Tubes2': (context) => Tubes2(),
    },
  ));
}

class Home extends StatelessWidget {
  final List page = ["Tubes 1", "Tubes 2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TP 13_Home"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    (index == 0)
                        ? Container(
                            width: 50.0,
                            height: 50.0,
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(100),
                              // border: Border.all(width: 3, color: Colors.black)
                            ),
                          )
                        : Container(
                            width: 50.0,
                            height: 50.0,
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(100),
                              // border: Border.all(width: 3, color: Colors.black)
                            ),
                          ),
                    TextButton(
                      onPressed: () {
                        if(index == 0){
                          Navigator.pushNamed(context, '/Tubes1');
                        } else{
                          Navigator.pushNamed(context, '/Tubes2');
                        }
                      },
                      child: Text(page[index], style: const TextStyle(fontSize: 30)
                      )
                    )
                  ],
                )),
          );
        },
        itemCount: page.length,
      ),
    );
  }
}

class Tubes1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TP 13_Tubes 1"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Text("Tubes 1", style: TextStyle(fontSize: 30, color: Colors.blue)),
               Text("Web App With Laravel", style: TextStyle(fontSize: 20))
            ],
          )
        )
    );
  }
}

class Tubes2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TP 13_Tubes 2"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Text("Tubes 2", style: TextStyle(fontSize: 30, color: Colors.blue)),
               Text("Mobile App With Flutter", style: TextStyle(fontSize: 20))
            ],
          )
        )
    );
  }
}
