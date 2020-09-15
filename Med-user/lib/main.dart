import 'package:flutter/material.dart';
import 'package:medicine_reminder/joinus/login.dart';
import 'package:medicine_reminder/joinus/signinorregister.dart';
import 'package:medicine_reminder/src/Drawer/drawer.dart';

void main() {
  // setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
    
  }
}
