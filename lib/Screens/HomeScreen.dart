import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class Home_Screen extends StatefulWidget {
  dynamic data;
  //constructor
  Home_Screen({this.data});

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

// ignore: camel_case_types
class _Home_ScreenState extends State<Home_Screen> {
  // ignore: non_constant_identifier_names
  void UpdateUI(dynamic Data) {}

  @override
  void initState() {
    UpdateUI(widget.data);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('COVID-19 Tracker'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),),

              height: 100,
              width: double.infinity,
            ),
          ],
        )
      ),
    );
  }
}
