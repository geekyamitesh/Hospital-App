import 'package:apk/Screens/homepage.dart';
import 'package:flutter/material.dart';

import 'Screens/tab.dart';

void main() {
  runApp(mainpage());
}

class mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
