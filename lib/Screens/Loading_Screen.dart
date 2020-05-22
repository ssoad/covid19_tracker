import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'HomeScreen.dart';
import 'package:covid19_tracker/Networking/Network.dart';

// ignore: camel_case_types
class loading_screen extends StatefulWidget {
  @override
  _loading_screenState createState() => _loading_screenState();
}

// ignore: camel_case_types
class _loading_screenState extends State<loading_screen> {
  // ignore: non_constant_identifier_names
  void getData() async {
    print("HomePushed");
    Network network = Network('https://coronavirus-19-api.herokuapp.com/countries/bangladesh');
    var T = await network.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Home_Screen(
        data: T,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getData();
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
