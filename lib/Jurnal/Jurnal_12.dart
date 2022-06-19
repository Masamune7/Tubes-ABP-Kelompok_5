import 'package:flutter/material.dart';

/// Dibuat Oleh 
/// Alif Rahmat Julianda
/// 1301190451
/// IF-43-06

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  // bot navbar
  int _selectedNavbar = 0;
  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }
  // drop down
  static String dropdownvalue = 'Apple';
  var items = ['Apple', 'Orange', 'Pear', 'Banana'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jurnal 12_1301190451"),
        centerTitle: true,
      ),
      body: Center(
          child: (_selectedNavbar == 0)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Pilihan:  "),
                    DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),    
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) { 
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                    Container(
                      child: ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          primary: Colors.white),
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      child: Text('Lanjut'),
                      )
                    ),
                  ],
                )

              : (_selectedNavbar == 1)
              ? Text("Halaman dua")
              : Text("Halaman tiga")
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    content: Text("Anda Memilih ${_Home.dropdownvalue} "),
    actions: [okButton],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
