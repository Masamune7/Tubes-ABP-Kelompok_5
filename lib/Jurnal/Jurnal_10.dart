import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
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
      appBar: AppBar(
        title: const Text('Tugas Pendahuluan 8'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Nama/Nim
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 3, color: Colors.black)
                ),
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

          // Anggota tim

          Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              "Anggota Tim",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
          ),

          // ListView

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
                          ): (index %3 != 0)?const Icon(
                            Icons.account_circle_outlined,
                            size: 50.0,
                          ): (index/3 == 0)? const Icon(
                            Icons.thumb_up,
                            color: Colors.blue,
                          ): const Icon(
                            Icons.account_circle_outlined,
                            color: Colors.red,
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
    );
  }
}
