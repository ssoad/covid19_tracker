import 'package:flutter/material.dart';

class ReUse extends StatelessWidget {
  ReUse({this.color,this.text});
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
       Row(
        children: <Widget>[
          Container(
            height: 12,
            width: 12,
            color:color,
          ),
          SizedBox(
            width: 5,
          ),
          Text(text,
            style: TextStyle(
              fontSize: 20,
              color: color,
            ),),
        ],
      ),
      SizedBox(
        height: 5,
      )]
    );
  }
}
