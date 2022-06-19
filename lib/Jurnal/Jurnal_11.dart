import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 5,
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> nama = <String>[
      'Rizky Asep Sutrisna',
      'Alif Rahmat julianda',
      'Zaky Mahfudz Pasha',
      'Wina Munawaroh',
      'Muhammad Nur Ilyas'
    ];
    return Scaffold(
      // Header
      appBar: AppBar(
        title: const Text('Praktikum App'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        bottom: TabBar(
          onTap:(index){

          },
            
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.wallet_travel), text: 'Account'),
            Tab(icon: Icon(Icons.alarm), text: 'Alarm'),
            Tab(icon: Icon(Icons.power_off), text: 'Power off'),
            Tab(icon: Icon(Icons.account_box_outlined), text: 'Account')
          ]
        )
      ),
      //Main Body
      body: TabBarView(
        children: [
          GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              Container(
                padding: const EdgeInsets.all(8), 
                child: const Center(child: Text("Test Praktikum")),
              ),
              Container(
                padding: const EdgeInsets.all(8), 
                color: Colors.brown,
                child: const Text("grid 1"),
              ),
              Container(
                padding: const EdgeInsets.all(8), 
                color: Colors.blue,
                child: const Text("grid 2"),
              ),
              Container(
                padding: const EdgeInsets.all(8), 
                color: Colors.green,
                child: const Text("grid 3"),
              ),
              Container(
                padding: const EdgeInsets.all(8), 
                color: Colors.black,
                child: const Text("grid 4"),
              ),
              Container(
                padding: const EdgeInsets.all(8), 
                color: Colors.red,
                child: const Text("grid 5"),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Expanded(
            child:ListView.builder(
              itemCount: nama.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 75,
                  decoration: BoxDecoration(
                    color: (index %2 == 0)? Colors.blueGrey[100]: Colors.blueGrey[200],
                    border: Border.all(color: Colors.blueGrey)
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 55.0,
                        height: 55.0,
                        color: (index %2 == 0)? Colors.blueGrey[300]: Colors.blueGrey[100],
                        margin: const EdgeInsets.all(10.0),
                        child: (index %3 == 0)? const Icon(
                            Icons.account_circle,
                            size: 50.0,
                          ): const Icon(
                            Icons.account_circle_outlined,
                            size: 50.0,
                          )
                      ),
                      
                      Text(nama[index]),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: const Icon(
                              Icons.group,
                              size: 25.0,
                            ),
                          ),
                      ),
                    ]
                  ),
                );
              }
            )
          ),
          ],
          ),
          Container(),
          Container(),
          Container(),
        ],
      )
    );
  }
}
