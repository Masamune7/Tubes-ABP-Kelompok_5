import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  static String? nama = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Header
        appBar: AppBar(
          title: const Text('Tugas Pendahuluan'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        //Main Body
        body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  onSaved: (String? value) => setState(() => nama = value),
                  decoration: const InputDecoration(
                      hintText: 'Masukkan Namamu', labelText: 'Nama'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Nama haruslah diisi';
                    }
                    return null;
                  },
                ),
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue, 
                      primary: Colors.white
                    ),
                    onPressed: () {
                      final isValid = _formKey.currentState?.validate();
                      if (!isValid!) {
                        return;
                      }
                      _formKey.currentState?.save();
                      showAlertDialog(context);
                    },
                    child: Text('Lanjut'),
                  )
                ),
              ],
            )));
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    content: Text("Selamat Datang ${_HomeState.nama} "),
    actions: [okButton],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      }
  );
}
