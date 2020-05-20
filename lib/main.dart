import 'package:flutter/material.dart';
import 'package:covid19_tracker/Screens/Loading_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: loading_screen(),
      );
  }
}



