import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  Future<void> SeeAlert(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), ()=>showAlertDialog(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TP 14"),
          centerTitle: true,
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () => SeeAlert(context),
          child: const Text("Click Me!"),
        )));
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = FlatButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Button Clicked"),
    content: const Text("Button is Clicked"),
    actions: [okButton],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
