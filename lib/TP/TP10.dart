import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Pendahuluan 8'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                color: Colors.blue,
                margin: const EdgeInsets.all(10.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Alif Rahmat Julianda",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("1301190451"),
                ],
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250.0,
            child: Stack(
              children: <Widget>[
                // Container 1
                Container(
                  height: 250.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),
                //container 2
                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                        Colors.blue,
                        Colors.blueGrey,
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text("TP 8",
                              style: TextStyle(color: Colors.white))),
                      const Text("Orchid Forest",
                          style:
                              TextStyle(color: Colors.white, fontSize: 30.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.white,
                            size: 50.0,
                          ),
                          // AssetImage(flutter.logo)
                          FlutterLogo(size: 75.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
