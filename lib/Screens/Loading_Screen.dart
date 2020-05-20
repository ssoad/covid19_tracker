import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading_screen extends StatefulWidget {
  @override
  _loading_screenState createState() => _loading_screenState();
}

class _loading_screenState extends State<loading_screen> {
  @override
  void initState() {
    super.initState();
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
