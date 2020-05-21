import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'HomeScreen.dart';

// ignore: camel_case_types
class loading_screen extends StatefulWidget {
  @override
  _loading_screenState createState() => _loading_screenState();
}

// ignore: camel_case_types
class _loading_screenState extends State<loading_screen> {
  // ignore: non_constant_identifier_names
  void HomePush() async {
    print("HomePushed");
    var T = await sleep(new Duration(
      seconds: 20,
    ));

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Home_Screen(
        data: "",
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    HomePush();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blueGrey,
          size: 50,
        ),
      ),
    );
  }
}
