import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19_tracker/Components/ReUseable.dart';
import 'package:covid19_tracker/Networking/Network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid19_tracker/Components/chart.dart';

// ignore: camel_case_types, must_be_immutable
class Home_Screen extends StatefulWidget {
  dynamic data;
  //constructor
  //Home_Screen({this.data});

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

// ignore: camel_case_types
class _Home_ScreenState extends State<Home_Screen> {
  Map<String, double> data = new Map();
  void getData() async {
    print("HomePushed");
    Network network = Network('https://coronavirus-19-api.herokuapp.com/countries/bangladesh');
    widget.data = await network.getData();
    UpdateUI(widget.data);
    data.addAll({'Total Case':double.parse(cases),'Total Deaths':double.parse(deaths),'Active':double.parse(active),'Recovered':double.parse(recovered),});
    setState(() {
      UpdateUI(widget.data);
    });
  }

  String country,cases,todayCases,deaths,todayDeaths,recovered,active,critical,casesPerOneMillion,deathsPerOneMillion,totalTests,testsPerOneMillion;
  // ignore: non_constant_identifier_names
  void UpdateUI(dynamic Data) {
    this.country= Data['country'].toString();
    this.cases = Data['cases'].toString();
    this.todayCases = Data['todayCases'].toString();
    this.deaths = Data['deaths'].toString();
    this.todayDeaths = Data['todayDeaths'].toString();
    this.recovered = Data['recovered'].toString();
    this.active = Data['active'].toString();
    this.critical = Data['critical'].toString();
    this.casesPerOneMillion = Data['casesPerOneMillion'].toString();
    this.deathsPerOneMillion = Data['deathsPerOneMillion'].toString();
    this.totalTests =Data['totalTests'].toString();
    this.testsPerOneMillion = Data['testsPerOneMillion'].toString();

  }
  @override
  void initState() {
    super.initState();
    getData();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    //data!=null?UpdateUI(widget.data):0;
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('COVID-19 Tracker'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: widget.data!=null?ListView(

          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(country,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Today's Condition",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w300,
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ReUse(
                              text: 'Today Case: $todayCases',
                              color: Colors.amberAccent,
                            ),
                            ReUse(
                              text: 'Today Deaths: $todayDeaths',
                              color: Colors.red,
                            ),
                            ReUse(
                              text:'Critical: $critical',
                              color: Colors.red[300],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ],
                ),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Overall Condition",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                      ),),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ReUse(
                              text: 'Total Case: $cases',
                              color: Colors.white,
                            ),
                            ReUse(
                              text: 'Total Deaths: $deaths',
                              color: Colors.red,
                            ),
                            ReUse(
                              text: 'Active: $active',
                              color: Colors.amberAccent,
                            ),
                            ReUse(
                              text: 'Recovered: $recovered',
                              color: Colors.green,
                            ),
                            ReUse(
                              text: 'Total Test: $totalTests',
                              color: Colors.yellow,
                            ),
                            ReUse(
                              text: 'Cases Per One Million: $casesPerOneMillion',
                              color: Colors.yellowAccent,
                            ),
                            ReUse(
                              text: 'Deaths Per One Million: $deathsPerOneMillion',
                              color: Colors.red,
                            ),
                            ReUse(
                              text: 'Test Per One Million: $testsPerOneMillion',
                              color: Colors.orangeAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Charts(
              data: data,
            )
          ],
        ):Center(
          child: SpinKitFadingCircle(
            color: Colors.blueGrey,
            size: 50,
          ),
        ),
      ),
    );
  }
}
