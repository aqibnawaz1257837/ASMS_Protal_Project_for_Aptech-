import 'package:flutter/material.dart';

import 'Screens/Spleash_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySpleashScreen(),
    );
  }
}







