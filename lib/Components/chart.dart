import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
//import 'package:charts_flutter/flutter.dart' as chart;
//Map<String, double> data = new Map();
//bool _loadChart = false;
List<Color> _colors = [
  Colors.amberAccent,
  Colors.redAccent,
  Colors.brown,
  Colors.green,
];

    class Charts extends StatelessWidget {
      Map<String,double> data;
      Charts({this.data});
      @override
      Widget build(BuildContext context) {
        return PieChart(
        dataMap: data,
        colorList: _colors, // if not declared, random colors will be chosen
        animationDuration: Duration(milliseconds: 1500),
        chartLegendSpacing: 32.0,
        chartRadius: MediaQuery.of(context).size.width /
        2, //determines the size of the chart
        showChartValuesInPercentage: false,
        showChartValues: true,
        showChartValuesOutside: true,
        chartValueBackgroundColor: Colors.grey[200],
        showLegends: true,

        legendPosition: LegendPosition.right, //can be changed to top, left, bottom
        decimalPlaces: 0,
        showChartValueLabel: true,
        initialAngle: 0,
        chartValueStyle: defaultChartValueStyle.copyWith(
        color: Colors.blueGrey[900].withOpacity(0.9),
),
chartType: ChartType.disc, //can be changed to ChartType.ring
);
      }
    }
