import 'package:flutter/material.dart';
import 'screens/Auth/Login.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter/foundation.dart';



void main() {
  // if(defaultTargetPlatform == TargetPlatform.android){
  // AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      );
  }
}

